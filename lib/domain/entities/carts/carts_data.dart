

import 'carts_items.dart';

class CartsData {
  List<CartsItems> cartsItems;
  dynamic subTotal;
  dynamic total;

  CartsData({
    required this.cartsItems,
    required this.subTotal,
    required this.total,
  });
}
