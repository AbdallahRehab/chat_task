import 'package:flutter/material.dart';

import '../../presentation/screens/login_screen.dart';
import '../services/cache_helper.dart';
import 'navigation.dart';

class AppConstance {
  static const String baseUrl = 'https://student.valuxapps.com/api/';
  static const String login = 'login';
  static const String register = 'register';
  static const String home = 'home';
  static const String categories = 'categories';
  static const String favorites = 'favorites';
  static const String profile = 'profile';
  static const String updateProfile = 'update-profile';
  static const String search = 'products/search';
  static const String carts = 'carts';
  static String? token;

  static void signOut({required BuildContext context}) {
    CacheHelper.removeData(key: 'token').then(
      (value) {
        if (value) {
          //todo: check if this two variables are cleared.
          //  HomeCubit.get(context).getFavoritesModel=null;
          //  HomeCubit.get(context).profileModel=null;
          navigateAndRemove(context, LoginScreen());
        }
      },
    );
  }

}
