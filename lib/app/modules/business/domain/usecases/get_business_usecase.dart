import 'package:dartz/dartz.dart';

import 'package:comercio_clean_architecture/app/modules/business/domain/entities/business_entity.dart';
import 'package:comercio_clean_architecture/app/modules/business/domain/repositories/business_repository_interface.dart';
import 'package:comercio_clean_architecture/app/shared/errors/failures.dart';
import 'package:comercio_clean_architecture/app/shared/usecases/usercase.dart';

class GetBusinessUsecase implements Usecase<BusinessEntity, NoParams> {
  final IBusinessRepository repository;
  GetBusinessUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, BusinessEntity>> call(
      {required NoParams params}) async {
    return await repository.getBusinessInformation();
  }
}
