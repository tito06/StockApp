import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_app/services/auth_service.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AsyncValue<String?>>(
  (ref) => AuthNotifier(ref.read(authServiceProvider)),
);

class AuthNotifier extends StateNotifier<AsyncValue<String?>> {
  final AuthService _authService;

  AuthNotifier(this._authService) : super(const AsyncValue.data(null)) {
    _loadToken();
  }

  Future<void> _loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = await _authService.getToken();
    if (token != null) {
      state = AsyncValue.data(token);
    } else {
      state = const AsyncValue.data(null);
    }
  }

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();

    try {
      final token = await AuthService().login(email, password);

      if (token != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("auth_token", token);
        state = AsyncValue.data(token);
      } else {
        state = const AsyncValue.error("Invalid login", StackTrace.empty);
      }
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    await _authService.logout();
    state = AsyncValue.data(null);
  }
}
