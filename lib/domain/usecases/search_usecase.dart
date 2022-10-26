

import '../entities/search_product/search_product.dart';
import '../repository/baseShopRepository.dart';

class SearchUsecase {
  BaseShopRepository baseShopRepository;

  SearchUsecase({required this.baseShopRepository});

  Future<SearchProduct> execute({required Map<String, String> data}) async {
    return await baseShopRepository.search(data: data);
  }
}
