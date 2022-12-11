import '../../data/repositories/app_repositories_impl.dart';
import '../repositories/app_repositories.dart';

final AppRepositories repositories = AppRepositoriesImpl();

class PostTransaction {
  Future<dynamic> call(String url, Map data) async {
    try {
      return await repositories.postTransaction(url, data);
    } catch (e) {
      rethrow;
    }
  }
}
