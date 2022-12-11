import '../../data/repositories/app_repositories_impl.dart';
import '../repositories/app_repositories.dart';

final AppRepositories repositories = AppRepositoriesImpl();

class PostCart {
  Future<dynamic> call(String url, Map data) async {
    try {
      return await repositories.postCart(url, data);
    } catch (e) {
      rethrow;
    }
  }
}
