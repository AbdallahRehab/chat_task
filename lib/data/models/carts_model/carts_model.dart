import 'dart:developer';



import '../../../domain/entities/carts/carts.dart';
import 'carts_data_model.dart';

class CartsModel extends Carts {
  CartsModel({
    required super.status,
    required super.data,
  });

  factory CartsModel.fromJson(Map<String, dynamic> json) => CartsModel(
        status: json['status'],
        data: CartsDataModel.fromJson(
          json['data'],
        ),
      );
}
