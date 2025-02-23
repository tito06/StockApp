import 'dart:convert';
import 'dart:ffi';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_app/models/search_stock_response.dart';
import 'package:stock_app/models/stock_detail_response.dart';

final authServiceProvider = Provider((ref) => AuthService());

class AuthService {
  final String _baseUrl = "https://illuminate-production.up.railway.app/api";

  Future<String> login(String email, String password) async {
    final response = await http.post(Uri.parse("$_baseUrl/auth/local"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"identifier": email, "password": password}));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data["jwt"];

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("auth_token", token);

      return token;
    } else {
      throw Exception("Login failed.");
    }
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("auth_token");
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("auth_token");
  }

  Future<List<SearchStockResponse>> fetchStock(String query) async {
    try {
      final String? token = await getToken();
      if (token == null) throw Exception("Authentication token is missing");

      final response = await http.get(
        Uri.parse("$_baseUrl/stocks/search?query=$query"),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);

        return jsonData
            .map((item) {
              try {
                return SearchStockResponse.fromJson(item);
              } catch (e) {
                print("Error parsing item: $item \nError: $e");
                return null;
              }
            })
            .whereType<SearchStockResponse>()
            .toList();
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching stocks: $e");
    }
  }

  Future<StockDetailResponse> fetchStockDetail(String stockId) async {
    try {
      final String? token = await getToken();
      if (token == null) throw Exception("Authentication token is missing");

      final response = await http.get(
        Uri.parse("$_baseUrl/stocks/$stockId"),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);

        return StockDetailResponse.fromJson(jsonData);
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching stocks: $e");
    }
  }
}
