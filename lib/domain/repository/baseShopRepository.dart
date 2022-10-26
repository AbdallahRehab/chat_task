import 'package:dartz/dartz.dart';

import '../entities/carts/carts.dart';
import '../entities/carts/post_carts.dart';
import '../entities/categories/categories.dart';
import '../entities/favorites/get_favorites.dart';
import '../entities/favorites/post_favorites.dart';
import '../entities/home/home.dart';
import '../entities/profile/profile.dart';
import '../entities/search_product/search_product.dart';
import 'package:full_chat_application/domain/entities/login.dart';
abstract class BaseShopRepository {
  Future<Either<String, Login>> postLogin({required Map<String, dynamic> data});

  Future<Login> postRegister({required Map<String, dynamic> data});

  Future<Home> getHomeData();

  Future<Categories> getCategories();

  Future<GetFavorites> getFavorites();

  Future<PostFavorites> postFavorites({required Map<String, int> data});

  Future<Profile> getProfile();

  Future<Profile> updateProfile({required Map<String, dynamic> data});

  Future<SearchProduct> search({required Map<String, String> data});

  Future<PostCarts> postCarts({required Map<String, dynamic> data});
  Future<Carts> getCarts();
}
