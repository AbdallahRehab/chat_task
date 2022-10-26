

import '../entities/carts/carts.dart';
import '../repository/baseShopRepository.dart';

class GetCartsUsecase {
  BaseShopRepository baseShopRepository;

  GetCartsUsecase({required this.baseShopRepository});

  Future<Carts> execute() async {
    return await baseShopRepository.getCarts();
  }
}
