import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/domain/usecases/fetch_cart.dart';
import 'package:store/domain/usecases/post_cart.dart';
import '../../../domain/entites/cart.dart';
import 'cart_event.dart';
import 'cart_state.dart';

final PostCart postCart = PostCart();
final FetchCart fetchCart = FetchCart();

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartInitialState()) {
    on<AddToCart>(_onPostCart);
    on<GetCart>(_onGetCart);
  }

  FutureOr<void> _onPostCart(AddToCart event, Emitter<CartState> emit) async {
    try {
      emit(CartLoadingState());
      await postCart('/api/keranjang',
          {'product_id': event.productId.toString(), 'qty': "1"});

      emit(CartItemAddedSuccessfulyState(
          successMessage: "Berhasil ditambahkan ke keranjang"));
    } catch (e) {
      emit(
        CartErrorFetchDataState(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  FutureOr<void> _onGetCart(GetCart event, Emitter<CartState> emit) async {
    try {
      emit(CartLoadingState());

      final carts = await fetchCart("/api/keranjang/");

      int total = await _sumTotalPrice(carts);

      emit(CartSuccessFetchDataState(cartItems: carts, total: total));
    } catch (e) {
      emit(
        CartErrorFetchDataState(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<int> _sumTotalPrice(List<Cart> carts) async {
    int total = 0;

    for (var i in carts) {
      total += i.cartProduct.harga;
    }

    return total;
  }
}
