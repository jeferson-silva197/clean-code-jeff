import 'dart:convert';
import 'package:comercio_clean_architecture/app/modules/business/domain/entities/menu_entity.dart';

class MenuModel extends MenuEntity {
  MenuModel({
    required int id,
    required String image,
    required double price,
    required String description,
  }) : super(description: description, id: id, image: image, price: price);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'price': price,
      'description': description,
    };
  }

  factory MenuModel.fromMap(Map<String, dynamic> map) {
    return MenuModel(
      id: map['id'],
      image: map['image'],
      price: map['price'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuModel.fromJson(String source) =>
      MenuModel.fromMap(json.decode(source));
}
