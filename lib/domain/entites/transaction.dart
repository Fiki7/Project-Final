class Transaction {
  final int id;
  final int total;
  final String status;
  final String alamat;
  final int userId;
  final String createdAt;
  final List<TransactionProduct> transactionProduct;

  Transaction(
      {required this.id,
      required this.total,
      required this.status,
      required this.alamat,
      required this.userId,
      required this.createdAt,
      required this.transactionProduct});
}

class TransactionProduct {
  final int id;
  final String name;
  final int categoryId;
  final String image;
  final int harga;
  final String description;
  final int stock;
  final String createdAt;
  final PivotTransaction pivotTransaction;

  TransactionProduct(
      {required this.id,
      required this.name,
      required this.categoryId,
      required this.image,
      required this.harga,
      required this.description,
      required this.createdAt,
      required this.stock,
      required this.pivotTransaction});

  factory TransactionProduct.fromJson(Map<String, dynamic> json) =>
      TransactionProduct(
        id: json['id'],
        name: json['name'],
        categoryId: json['category_id'],
        image: json['image'],
        harga: json['harga'],
        description: json['deskripsi'],
        createdAt: json['created_at'],
        stock: json['stock'],
        pivotTransaction: PivotTransaction.fromJson(json['pivot']),
      );
}

class PivotTransaction {
  final int transactionId;
  final int productId;
  final int quantity;

  PivotTransaction(
      {required this.productId,
      required this.quantity,
      required this.transactionId});

  factory PivotTransaction.fromJson(Map<String, dynamic> json) =>
      PivotTransaction(
          productId: json['transaction_id'],
          quantity: json['qty'],
          transactionId: json['product_id']);
}
