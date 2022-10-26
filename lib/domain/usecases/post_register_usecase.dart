

import 'package:full_chat_application/domain/entities/login.dart';
import '../repository/baseShopRepository.dart';

class PostRegisterUsecase {
  BaseShopRepository baseShopRepository;

  PostRegisterUsecase({required this.baseShopRepository});

  Future<Login> execute({required Map<String, dynamic> data}) async {
    return await baseShopRepository.postRegister(data: data);
  }
}
