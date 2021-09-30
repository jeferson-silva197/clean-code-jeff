import 'package:comercio_clean_architecture/app/modules/auth/domain/entities/credential_params_entity.dart';
import 'package:comercio_clean_architecture/app/modules/auth/domain/entities/logged_account_entity.dart';
import 'package:comercio_clean_architecture/app/shared/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthRepository {
  Future<Either<Failure, AccountEntity>> authenticate(
      {required CredentialsParamsEntity params});
}
