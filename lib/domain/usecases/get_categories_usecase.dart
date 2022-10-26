

import '../entities/categories/categories.dart';
import '../repository/baseShopRepository.dart';

class GetCategoriesUsecase {
  BaseShopRepository baseShopRepository;

  GetCategoriesUsecase({required this.baseShopRepository});

  Future<Categories> execute() async {
    return await baseShopRepository.getCategories();
  }
}
