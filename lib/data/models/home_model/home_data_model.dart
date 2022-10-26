

import 'package:full_chat_application/data/models/home_model/products_model.dart';

import '../../../domain/entities/home/banners.dart';
import '../../../domain/entities/home/home_data.dart';
import '../../../domain/entities/home/products.dart';
import 'banners_model.dart';

class HomeDataModel extends HomeData {
  HomeDataModel({super.banners, super.products});

  factory HomeDataModel.fromJson(Map<String, dynamic> json) => HomeDataModel(
        banners: List<Banners>.from(
            json['banners'].map((e) => BannersModel.fromJson(e))),
        products: List<Products>.from(
            json['products'].map((e) => ProductsModel.fromJson(e))),
      );
}
