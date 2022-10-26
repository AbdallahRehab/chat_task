import 'dart:developer';



import '../../../domain/entities/favorites/favorites_data.dart';
import '../home_model/products_model.dart';

class FavoritesDataModel extends FavoritesData {
  FavoritesDataModel({
    required super.id,
    required super.favoritesDataProduct,
  });

  factory FavoritesDataModel.fromJson(Map<String, dynamic> json) =>
      FavoritesDataModel(
        id: json['id'],
        favoritesDataProduct: ProductsModel.fromFavJson(
          json['product'],
        ),
      );
}
