

import '../../../domain/entities/home/products.dart';
import '../../../domain/entities/search_product/search_product.dart';
import '../home_model/products_model.dart';

class SearchProductModel extends SearchProduct {
  SearchProductModel({required super.status, required super.data});

  factory SearchProductModel.fromJson(Map<String, dynamic> json) =>
      SearchProductModel(
        status: json['status'],
        data: List<Products>.from(json['data']['data'].map((e) {
          return ProductsModel.fromJson(e);
        })),
      );
}
