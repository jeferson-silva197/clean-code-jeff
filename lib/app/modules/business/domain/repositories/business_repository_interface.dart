import 'package:comercio_clean_architecture/app/modules/business/domain/entities/business_entity.dart';
import 'package:comercio_clean_architecture/app/shared/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class IBusinessRepository {
  Future<Either<Failure, BusinessEntity>> getBusinessInformation();
}
