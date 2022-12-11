import 'package:store/domain/entites/transaction.dart';

class TransactionModel extends Transaction {
  TransactionModel(
      {required super.id,
      required super.total,
      required super.status,
      required super.alamat,
      required super.userId,
      required super.createdAt,
      required super.transactionProduct});

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        id: json['id'],
        total: json['total'],
        status: json['status'],
        alamat: json['alamat'],
        userId: json['user_id'],
        createdAt: json['created_at'],
        transactionProduct: (json['products'] as List)
            .map(
              (e) => TransactionProductModel.fromJson(e),
            )
            .toList(),
      );
}

class TransactionProductModel extends TransactionProduct {
  TransactionProductModel(
      {required super.id,
      required super.name,
      required super.categoryId,
      required super.image,
      required super.harga,
      required super.description,
      required super.createdAt,
      required super.stock,
      required super.pivotTransaction});

  factory TransactionProductModel.fromJson(Map<String, dynamic> json) =>
      TransactionProductModel(
        id: json['id'],
        name: json['name'],
        categoryId: json['category_id'],
        image: json['image'],
        harga: json['harga'],
        description: json['deskripsi'],
        createdAt: json['created_at'],
        stock: json['stock'],
        pivotTransaction: PivotTransactionModel.fromJson(json['pivot']),
      );
}

class PivotTransactionModel extends PivotTransaction {
  PivotTransactionModel(
      {required super.productId,
      required super.quantity,
      required super.transactionId});
  factory PivotTransactionModel.fromJson(Map<String, dynamic> json) =>
      PivotTransactionModel(
          productId: json['transaction_id'],
          quantity: json['qty'],
          transactionId: json['product_id']);
}
