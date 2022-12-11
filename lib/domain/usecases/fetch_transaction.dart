import 'package:store/domain/entites/transaction.dart';

import '../../data/repositories/app_repositories_impl.dart';
import '../repositories/app_repositories.dart';

final AppRepositories repositories = AppRepositoriesImpl();

class FetchTransaction {
  Future<List<Transaction>> call(String url) async {
    try {
      return await repositories.fetchTransaction(url);
    } catch (e) {
      rethrow;
    }
  }
}
