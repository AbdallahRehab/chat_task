import 'dart:developer';



import '../../../domain/entities/home/banners.dart';

class BannersModel extends Banners {
  BannersModel({super.id, super.image});

  factory BannersModel.fromJson(Map<String, dynamic> json) => BannersModel(
        id: json['id'],
        image: json['image'],
      );
}
