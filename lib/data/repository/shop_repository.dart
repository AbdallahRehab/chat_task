import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../domain/entities/carts/carts.dart';
import '../../domain/entities/carts/post_carts.dart';
import '../../domain/entities/categories/categories.dart';
import '../../domain/entities/favorites/get_favorites.dart';
import '../../domain/entities/favorites/post_favorites.dart';
import '../../domain/entities/home/home.dart';
import '../../domain/entities/login.dart';
import '../../domain/entities/profile/profile.dart';
import '../../domain/entities/search_product/search_product.dart';
import '../../domain/repository/baseShopRepository.dart';
import '../data_source/remote_data_source.dart';

class ShopRepository extends BaseShopRepository {
  BaseRemoteDataSource baseRemoteDataSource;

  ShopRepository({required this.baseRemoteDataSource});

  @override
  Future<Either<String, Login>> postLogin(
      {required Map<String, dynamic> data}) async {
    final result = await baseRemoteDataSource.postLogin(data: data);

    try {
      return right(result);
    } catch (error) {
      return left(error.toString());
    }
  }

  @override
  Future<Home> getHomeData() async {
    return await baseRemoteDataSource.getHomeData();
  }

  @override
  Future<Categories> getCategories() async {
    return await baseRemoteDataSource.getCategories();
  }

  @override
  Future<PostFavorites> postFavorites({required Map<String, int> data}) async {
    return await baseRemoteDataSource.postFavorites(data: data);
  }

  @override
  Future<GetFavorites> getFavorites() async {
    return await baseRemoteDataSource.getFavorites();
  }

  @override
  Future<Profile> getProfile() async {
    return await baseRemoteDataSource.getProfile();
  }

  @override
  Future<Login> postRegister({required Map<String, dynamic> data}) async {
    return await baseRemoteDataSource.postRegister(data: data);
  }

  @override
  Future<Profile> updateProfile({required Map<String, dynamic> data}) async {
    return await baseRemoteDataSource.updateProfile(data: data);
  }

  @override
  Future<SearchProduct> search({required Map<String, String> data}) async {
    return await baseRemoteDataSource.search(data: data);
  }

  @override
  Future<PostCarts> postCarts({required Map<String, dynamic> data}) async{
   return await baseRemoteDataSource.postCarts(data: data);
  }

  @override
  Future<Carts> getCarts() async{
    return await baseRemoteDataSource.getCarts();
  }
}
