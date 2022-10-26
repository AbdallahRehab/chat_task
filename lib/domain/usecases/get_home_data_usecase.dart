

import '../entities/home/home.dart';
import '../repository/baseShopRepository.dart';


class GetHomeDataUsecase {
  BaseShopRepository baseShopRepository;

  GetHomeDataUsecase({required this.baseShopRepository});

  Future<Home> execute() async {
    return await baseShopRepository.getHomeData();
  }

}
