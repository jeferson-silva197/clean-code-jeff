import 'package:comercio_clean_architecture/app/modules/auth/domain/errors/auth_errors.dart';
import 'package:comercio_clean_architecture/app/shared/errors/exceptions.dart';
import 'package:comercio_clean_architecture/app/shared/errors/messages.dart';
import 'package:dartz/dartz.dart';

import 'package:comercio_clean_architecture/app/modules/auth/domain/entities/credential_params_entity.dart';
import 'package:comercio_clean_architecture/app/modules/auth/domain/entities/logged_account_entity.dart';
import 'package:comercio_clean_architecture/app/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:comercio_clean_architecture/app/modules/auth/infra/datasources/auth_datasource_interface.dart';
import 'package:comercio_clean_architecture/app/shared/errors/failures.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final IAuthDatasource datasource;
  AuthRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, AccountEntity>> authenticate(
      {required CredentialsParamsEntity params}) async {
    try {
      final result = await datasource.authenticate(params: params);
      return Right(result);
    } on InvalidCredentialsException {
      return Left(
          InvalidCredentialsFailure(message: Messages.INVALID_CREDENTIALS));
    } on ServerException {
      return Left(ServerFailure(message: Messages.SERVER_FAIL_REQUEST));
    }
  }
}
