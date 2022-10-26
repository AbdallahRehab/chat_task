

import '../../../domain/entities/home/home.dart';
import 'home_data_model.dart';

class HomeModel extends Home {
  HomeModel({required super.status, required super.data});

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        status: json['status'],
        data: HomeDataModel.fromJson(json['data']),
      );
}
