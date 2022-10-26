

import '../../../domain/entities/favorites/get_favorites.dart';
import 'favorites_data_model.dart';

class GetFavoritesModel extends GetFavorites {
  GetFavoritesModel({required super.status, required super.data});

  factory GetFavoritesModel.fromJson(Map<String, dynamic> json) =>
      GetFavoritesModel(
        status: json['status'],
        data: List<FavoritesDataModel>.from(
          json['data']['data'].map(
            (v) => FavoritesDataModel.fromJson(v),
          ),
        ),
      );
}
