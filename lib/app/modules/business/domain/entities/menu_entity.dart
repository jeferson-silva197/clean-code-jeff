import 'package:equatable/equatable.dart';

class MenuEntity extends Equatable {
  final int id;
  final String image;
  final double price;
  final String description;
  MenuEntity({
    required this.id,
    required this.image,
    required this.price,
    required this.description,
  });

  @override
  List<Object?> get props => [];
}
