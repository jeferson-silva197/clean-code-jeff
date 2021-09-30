import 'package:comercio_clean_architecture/app/modules/business/domain/errors/business_errors.dart';
import 'package:comercio_clean_architecture/app/shared/errors/exceptions.dart';
import 'package:comercio_clean_architecture/app/shared/errors/messages.dart';
import 'package:dartz/dartz.dart';

import 'package:comercio_clean_architecture/app/modules/business/domain/entities/business_entity.dart';
import 'package:comercio_clean_architecture/app/modules/business/domain/repositories/business_repository_interface.dart';
import 'package:comercio_clean_architecture/app/modules/business/infra/datasources/business_datasource_interface.dart';
import 'package:comercio_clean_architecture/app/shared/errors/failures.dart';

class BusinessRepositoryImpl implements IBusinessRepository {
  final IBusinessDatasource datasource;
  BusinessRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, BusinessEntity>> getBusinessInformation() async {
    try {
      final result = await datasource.getInformationBusiness();
      return Right(result);
    } on NotFoundException {
      return Left(NotFoundFailure(message: Messages.NOT_FOUND));
    } on ServerException {
      return Left(ServerFailure(message: Messages.SERVER_FAIL_REQUEST));
    }
  }
}
