import 'dart:convert';
import 'package:comercio_clean_architecture/app/modules/business/domain/entities/business_entity.dart';

class BusinessModel extends BusinessEntity {
  BusinessModel({
    required String name,
    required String description,
    required String image,
  }) : super(description: description, image: image, name: name);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'image': image,
    };
  }

  factory BusinessModel.fromMap(Map<String, dynamic> map) {
    return BusinessModel(
      name: map['name'],
      description: map['description'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BusinessModel.fromJson(String source) =>
      BusinessModel.fromMap(json.decode(source));
}
