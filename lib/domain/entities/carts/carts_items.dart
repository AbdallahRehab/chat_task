

import '../home/products.dart';

class CartsItems {
  int id;
  int quantity;
  Products cartItemsProduct;
  CartsItems({
    required this.id,
    required this.quantity,
    required this.cartItemsProduct,
  });
}
