import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_app/models/stock_detail_response.dart';
import 'package:stock_app/services/auth_service.dart';

final stockDetailProvider =
    StateNotifierProvider<StockDetailNotifier, AsyncValue<StockDetailResponse>>(
        (ref) => StockDetailNotifier(ref.read(authServiceProvider)));

class StockDetailNotifier
    extends StateNotifier<AsyncValue<StockDetailResponse>> {
  final AuthService _authService;

  StockDetailNotifier(this._authService) : super(const AsyncValue.loading());

  Future<void> fetchStockDetail({required String stockId}) async {
    state = const AsyncValue.loading();

    try {
      final data = await _authService.fetchStockDetail(stockId);
      state = AsyncValue.data(data);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
