

import '../../domain/entities/login.dart';
import 'login_data_model.dart';

class LoginModel extends Login {
  LoginModel({required super.status,required super.message, required super.data});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json['status'],
        message: json['message'],
        data: json['data']==null?null:LoginDataModel.fromJson(json['data']),
      );
}
