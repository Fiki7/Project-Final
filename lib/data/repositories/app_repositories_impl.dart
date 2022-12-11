import 'package:store/data/datasources/remote_repositories.dart';
import 'package:store/domain/entites/login.dart';
import 'package:store/domain/entites/product.dart';
import 'package:store/domain/entites/register.dart';
import 'package:store/domain/entites/transaction.dart';
import 'package:store/domain/repositories/app_repositories.dart';

import '../../domain/entites/cart.dart';

RemoteRepositories remoteRepositories = RemoteRepositoriesImpl();

class AppRepositoriesImpl implements AppRepositories {
  @override
  Future postLogin(Login login, String url) async {
    try {
      await remoteRepositories.postLogin(url, login.fromModel());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future postRegister(Register register, String url) async {
    try {
      await remoteRepositories.postRequest(url, register.fromModel());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Product> getProduct(String url) async {
    try {
      return await remoteRepositories.getProduct(url);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future postCart(String url, Map data) async {
    try {
      return await remoteRepositories.postCart(url, data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Cart>> fetchCart(String url) async {
    try {
      return await remoteRepositories.fetchCart(url);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future postTransaction(String url, Map data) async {
    try {
      return await remoteRepositories.postTransaction(url, data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Transaction>> fetchTransaction(String url) async {
    try {
      return await remoteRepositories.fetchTransaction(url);
    } catch (e) {
      rethrow;
    }
  }
}
