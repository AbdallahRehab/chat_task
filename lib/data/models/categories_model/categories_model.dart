

import '../../../domain/entities/categories/categories.dart';
import 'categories_data_model.dart';

class CategoriesModel extends Categories {
  CategoriesModel({required super.status, required super.data});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        status: json['status'],
        data: CategoriesDataModel.fromJson(json['data']),
      );
}
