

import '../entities/favorites/get_favorites.dart';
import '../repository/baseShopRepository.dart';

class GetFavoritesUsecase{
  BaseShopRepository baseShopRepository;

  GetFavoritesUsecase({required this.baseShopRepository});

  Future<GetFavorites> execute()async{
    return await baseShopRepository.getFavorites();
  }
}