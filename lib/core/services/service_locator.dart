import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../data/data_source/remote_data_source.dart';
import '../../data/repository/shop_repository.dart';
import '../../domain/repository/baseShopRepository.dart';
import '../../domain/usecases/get_carts_usecase.dart';
import '../../domain/usecases/get_categories_usecase.dart';
import '../../domain/usecases/get_favorites_usecase.dart';
import '../../domain/usecases/get_home_data_usecase.dart';
import '../../domain/usecases/get_profile_usecase.dart';
import '../../domain/usecases/post_carts_usecase.dart';
import '../../domain/usecases/post_favorites_usecase.dart';
import '../../domain/usecases/post_login_usecase.dart';
import '../../domain/usecases/post_register_usecase.dart';
import '../../domain/usecases/search_usecase.dart';
import '../../domain/usecases/update_profile_usecase.dart';
import '../utils/app_constance.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    ///data source
    sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());

    ///repository
    sl.registerLazySingleton<BaseShopRepository>(
        () => ShopRepository(baseRemoteDataSource: sl()));

    ///usecase
    sl.registerLazySingleton(() => PostLoginUsecase(baseShopRepository: sl()));
    sl.registerLazySingleton(
        () => PostRegisterUsecase(baseShopRepository: sl()));
    sl.registerLazySingleton(
        () => PostFavoritesUsecase(baseShopRepository: sl()));
    sl.registerLazySingleton(
        () => GetHomeDataUsecase(baseShopRepository: sl()));
    sl.registerLazySingleton(
        () => GetCategoriesUsecase(baseShopRepository: sl()));
    sl.registerLazySingleton(
        () => GetFavoritesUsecase(baseShopRepository: sl()));
    sl.registerLazySingleton(() => GetProfileUsecase(baseShopRepository: sl()));
    sl.registerLazySingleton(
        () => UpdateProfileUsecase(baseShopRepository: sl()));
    sl.registerLazySingleton(() => SearchUsecase(baseShopRepository: sl()));
    sl.registerLazySingleton(() => PostCartsUsecase(baseShopRepository: sl()));
    sl.registerLazySingleton(() => GetCartsUsecase(baseShopRepository: sl()));

    ///Dio()
    sl.registerFactory(
      () => Dio(
        BaseOptions(
          baseUrl: AppConstance.baseUrl,
          receiveDataWhenStatusError: true,
          headers: {
            'Content-Type': 'application/json',
            'lang': 'en',
            'Authorization': '${AppConstance.token}',
          },
        ),
      ),
    );
  }
}
