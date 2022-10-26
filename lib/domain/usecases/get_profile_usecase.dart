

import '../entities/profile/profile.dart';
import '../repository/baseShopRepository.dart';

class GetProfileUsecase{
  BaseShopRepository baseShopRepository;

  GetProfileUsecase({required this.baseShopRepository});

  Future<Profile> execute()async{
    return await baseShopRepository.getProfile();
  }
}