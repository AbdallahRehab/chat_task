

import '../entities/profile/profile.dart';
import '../repository/baseShopRepository.dart';

class UpdateProfileUsecase {
  BaseShopRepository baseShopRepository;

  UpdateProfileUsecase({required this.baseShopRepository});

  Future<Profile> execute({required Map<String, dynamic> data}) async {
    return await baseShopRepository.updateProfile(data: data);
  }
}
