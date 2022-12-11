import 'package:store/domain/entites/cart.dart';
import 'package:store/domain/entites/login.dart';
import 'package:store/domain/entites/product.dart';
import 'package:store/domain/entites/transaction.dart';

import '../entites/register.dart';

abstract class AppRepositories {
  Future<dynamic> postLogin(Login login, String url);
  Future<dynamic> postRegister(Register register, String url);
  Future<Product> getProduct(String url);
  Future<dynamic> postCart(String url, Map data);
  Future<dynamic> postTransaction(String url, Map data);
  Future<List<Cart>> fetchCart(String url);
  Future<List<Transaction>> fetchTransaction(String url);
}
