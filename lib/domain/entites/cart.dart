import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final int id;
  final int userId;
  final int productId;
  final int quantity;
  final CartProduct cartProduct;

  Cart(
      {required this.id,
      required this.cartProduct,
      required this.productId,
      required this.quantity,
      required this.userId});

  @override
  List<Object> get props => [id, userId, productId, quantity, cartProduct];
}

class CartProduct extends Equatable {
  final int id;
  final String name;
  final int categoryId;
  final String image;
  final int harga;
  final String deskripsi;
  final int stock;

  CartProduct(
      {required this.id,
      required this.categoryId,
      required this.deskripsi,
      required this.harga,
      required this.image,
      required this.name,
      required this.stock});

  @override
  List<Object> get props =>
      [id, categoryId, deskripsi, harga, image, name, stock];
}
