import 'package:equatable/equatable.dart';
import 'package:store/data/models/cart_item.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class AddProductToCartEvent extends CartEvent {
  final CartItem cartItem;
  const AddProductToCartEvent({required this.cartItem});
  @override
  List<Object?> get props => [];
}

class AddToCart extends CartEvent {
  final int productId;

  const AddToCart({required this.productId});

  @override
  List<Object> get props => [productId];
}

class GetCart extends CartEvent {
  @override
  List<Object> get props => [];
}
