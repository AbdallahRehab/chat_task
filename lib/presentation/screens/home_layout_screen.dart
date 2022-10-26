import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:full_chat_application/presentation/screens/carts_screen.dart';
import 'package:full_chat_application/presentation/screens/categories_screen.dart';
import 'package:full_chat_application/presentation/screens/products_screen.dart';
import 'package:full_chat_application/presentation/screens/settings_screen.dart';

import '../controllers/home_cubit/home_cubit.dart';
import 'favorites_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
class HomeLayoutScreen extends StatelessWidget {
  List<Widget> pages = [
    ProductsScreen(),
    CategoriesScreen(),
    CartsScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Salla'),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(9.0),
            child: GNav(
              gap: 10.0,
              color: Colors.blueGrey,
              activeColor: Colors.white,
              tabBackgroundGradient: const LinearGradient(colors: [
                Colors.blue,
                Colors.blueAccent,
                Colors.lightBlue,
                Colors.lightBlueAccent,
              ]),
              onTabChange: (value) {
                cubit.changeCurrentIndex(value);
              },
              padding: const EdgeInsets.all(12.0),
              tabs: const [
                GButton(
                  icon: IconlyBold.home,
                  text: 'Home',
                ),
                GButton(
                  icon: IconlyBold.category,
                  text: 'Categories',
                ),
                GButton(
                  icon: IconlyBold.bag,
                  text: 'Carts',
                ),
                GButton(
                  icon: IconlyBold.heart,
                  text: 'Favorites',
                ),
                GButton(
                  icon: IconlyBold.setting,
                  text: 'Settings',
                ),
              ],
            ),
          ),
          body: pages[cubit.currentIndex],
        );
      },
    );
  }
}
