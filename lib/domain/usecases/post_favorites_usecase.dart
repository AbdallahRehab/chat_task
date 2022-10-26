

import '../entities/favorites/post_favorites.dart';
import '../repository/baseShopRepository.dart';

class PostFavoritesUsecase {
  BaseShopRepository baseShopRepository;

  PostFavoritesUsecase({required this.baseShopRepository});

  Future<PostFavorites> execute({required Map<String, int> data}) async {
    return await baseShopRepository.postFavorites(data: data);
  }
}
