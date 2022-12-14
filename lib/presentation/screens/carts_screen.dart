import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../core/global/global_widget/global_widget.dart';
import '../../domain/entities/carts/carts_items.dart';
import '../controllers/home_cubit/home_cubit.dart';

class CartsScreen extends StatelessWidget {
  const CartsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        if (state is PostCartsLoadingState || state is GetCartsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return (cubit.cartsModel!.data.cartsItems.isEmpty)
              ? const Center(
                  child: Text(
                    'Empty Carts',
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return buildCartItem(
                              cubit.cartsModel!.data.cartsItems[index],
                              cubit,
                            );
                          },
                          itemCount: cubit.cartsModel!.data.cartsItems.length,
                        ),
                      ),
                      if ((cubit.cartsModel?.data.cartsItems.isNotEmpty)!)
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total :',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                          color: Colors.black54,
                                        ),
                                  ),
                                  Text(
                                    '\$${cubit.cartsModel?.data.total.round()}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
                                          color: Colors.indigoAccent,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            MaterialButton(
                              minWidth: double.infinity,
                              height: 50.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Colors.indigoAccent,
                              onPressed: () {},
                              child: Text(
                                'Buy Now',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                      color: Colors.white,
                                      letterSpacing: 1.0,
                                    ),
                              ),
                            ),
                          ],
                        )
                    ],
                  ),
                );
        }
      },
    );
  }

  Widget buildCartItem(CartsItems model, HomeCubit cubit) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        cubit.changeCarts(id: model.cartItemsProduct.id!);
      },
      direction: DismissDirection.startToEnd,
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        alignment: Alignment.centerLeft,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Icon(
            IconlyBold.delete,
            color: Colors.pink,
          ),
        ),
      ),
      child: SizedBox(
        height: 150.0,
        child: Card(
          color: Colors.grey.shade50,
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Card(
                  elevation: 7.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: buildCachedNetworkImage(
                      imageUrl: model.cartItemsProduct.image,
                      width: 90,
                      height: 110,
                      // fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 7.0,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.cartItemsProduct.name!,
                        maxLines: 2,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          height: 1.4,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Arial',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${model.cartItemsProduct.price.round()}',
                            style: const TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.w900,
                              fontSize: 12.0,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          if (model.cartItemsProduct.discount != 0)
                            Text(
                              '\$${model.cartItemsProduct.oldPrice.round()}',
                              style: const TextStyle(
                                color: Colors.black26,
                                fontWeight: FontWeight.w900,
                                fontSize: 11.0,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          // const Spacer(),
                          SizedBox(
                            height: 45.0,
                            child: Card(
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              color: Colors.white,
                              child: Row(
                                children: [
                                  MaterialButton(
                                    padding: EdgeInsets.zero,
                                    minWidth: 8.0,
                                    onPressed: () {},
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.indigo,
                                    ),
                                  ),
                                  Text(
                                    '${model.quantity}',
                                    style: const TextStyle(
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  MaterialButton(
                                    minWidth: 8.0,
                                    padding: EdgeInsets.zero,
                                    onPressed: () {},
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.indigo,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
