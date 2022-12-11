import 'package:store/domain/entites/cart.dart';

class CartModel extends Cart {
  CartModel(
      {required super.id,
      required super.cartProduct,
      required super.productId,
      required super.quantity,
      required super.userId});

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
      id: json['id'],
      cartProduct: CartProductModel.fromJson(json['product']),
      productId: json['product_id'],
      quantity: json['qty'],
      userId: json['user_id']);
}

class CartProductModel extends CartProduct {
  CartProductModel(
      {required super.id,
      required super.categoryId,
      required super.deskripsi,
      required super.harga,
      required super.image,
      required super.name,
      required super.stock});

  factory CartProductModel.fromJson(Map<String, dynamic> json) =>
      CartProductModel(
        id: json['id'] ?? 0,
        name: json['name'] ?? "null",
        categoryId: json['category_id'] ?? 0,
        image: json['image'] ?? "null",
        harga: json['harga'] ?? 0,
        deskripsi: json['deskripsi'] ?? "null",
        stock: json['stock'] ?? 0,
      );
}
