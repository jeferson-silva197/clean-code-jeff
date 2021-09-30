
import 'package:equatable/equatable.dart';

class BusinessEntity extends Equatable {
  final String name;
  final String description;
  final String image;

  BusinessEntity({
    required this.name,
    required this.description,
    required this.image,
  });

  @override
  List<Object?> get props => [];

  
}
