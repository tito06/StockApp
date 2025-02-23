import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_app/models/search_stock_response.dart';
import 'package:stock_app/services/auth_service.dart';

final searchStockProvider = StateNotifierProvider<SearchStockNotifier,
        AsyncValue<List<SearchStockResponse>>>(
    (ref) => SearchStockNotifier(ref.read(authServiceProvider)));

class SearchStockNotifier
    extends StateNotifier<AsyncValue<List<SearchStockResponse>>> {
  final AuthService _authService;

  SearchStockNotifier(this._authService) : super(const AsyncValue.loading());

  Future<void> fetchData({required String query}) async {
    state = const AsyncValue.loading();

    try {
      final data = await _authService.fetchStock(query);
      state = AsyncValue.data(data);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
