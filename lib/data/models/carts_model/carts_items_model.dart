

import '../../../domain/entities/carts/carts_items.dart';
import '../home_model/products_model.dart';

class CartItemsModel extends CartsItems {
  CartItemsModel({
    required super.id,
    required super.quantity,
    required super.cartItemsProduct,
  });

  factory CartItemsModel.fromJson(Map<String, dynamic> json) => CartItemsModel(
        id: json['id'],
        quantity: json['quantity'],
        cartItemsProduct: ProductsModel.fromJson(
          json['product'],
        ), //CartsItemsProductModel.fromJson(json['product']),
      );
}
