import 'package:comercio_clean_architecture/app/shared/usecases/usercase.dart';
import 'package:dartz/dartz.dart';
import 'package:string_validator/string_validator.dart';

import 'package:comercio_clean_architecture/app/modules/auth/domain/entities/credential_params_entity.dart';
import 'package:comercio_clean_architecture/app/modules/auth/domain/entities/logged_account_entity.dart';
import 'package:comercio_clean_architecture/app/modules/auth/domain/errors/auth_errors.dart';
import 'package:comercio_clean_architecture/app/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:comercio_clean_architecture/app/shared/errors/failures.dart';
import 'package:comercio_clean_architecture/app/shared/errors/messages.dart';

class AuthenticationUsecase
    implements Usecase<AccountEntity, CredentialsParamsEntity> {
  final IAuthRepository repository;
  AuthenticationUsecase({
    required this.repository,
  });

  Future<Either<Failure, AccountEntity>> call(
      {required CredentialsParamsEntity params}) async {
    if (!isEmail(params.email)) {
      return left(AuthFailure(message: Messages.INVALID_EMAIL));
    }
    if (params.password.isEmpty) {
      return left(AuthFailure(message: Messages.INVALID_PASSWORD));
    }
    return await repository.authenticate(params: params);
  }
}
