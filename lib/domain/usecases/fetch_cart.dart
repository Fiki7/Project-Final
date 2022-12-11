import '../../data/repositories/app_repositories_impl.dart';
import '../entites/cart.dart';
import '../repositories/app_repositories.dart';

final AppRepositories repositories = AppRepositoriesImpl();

class FetchCart {
  Future<List<Cart>> call(String url) async {
    try {
      return await repositories.fetchCart(url);
    } catch (e) {
      rethrow;
    }
  }
}
