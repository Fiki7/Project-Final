import 'package:equatable/equatable.dart';
import 'package:store/domain/entites/cart.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class CartInitialState extends CartState {
  const CartInitialState();

  @override
  List<Object?> get props => [];
}

// Loading state for the Favorite page
class CartLoadingState extends CartState {
  const CartLoadingState();

  @override
  List<Object?> get props => [];
}

// Error state for the Favorite page
class CartErrorFetchDataState extends CartState {
  final String errorMessage;
  const CartErrorFetchDataState({required this.errorMessage});

  @override
  List<Object?> get props => [];
}

// Success state for the Favorite page
class CartSuccessFetchDataState extends CartState {
  final List<Cart> cartItems;
  final int total;
  const CartSuccessFetchDataState(
      {required this.cartItems, required this.total});
  @override
  List<Object> get props => [cartItems];
}

class CartItemAddedSuccessfulyState extends CartState {
  final String successMessage;
  const CartItemAddedSuccessfulyState({required this.successMessage});

  @override
  List<Object?> get props => [];
}

class CartItemRemovedSuccessfulyState extends CartState {
  final String successMessage;
  const CartItemRemovedSuccessfulyState({required this.successMessage});

  @override
  List<Object?> get props => [];
}

class CartContentRemovedSuccessfulyState extends CartState {
  final String successMessage;
  const CartContentRemovedSuccessfulyState({required this.successMessage});

  @override
  List<Object?> get props => [];
}
