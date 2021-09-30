import 'package:comercio_clean_architecture/app/shared/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class Usecase<Output, Input> {
  Future<Either<Failure, Output>> call({required Input params});
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}