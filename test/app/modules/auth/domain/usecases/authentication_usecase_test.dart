import 'package:comercio_clean_architecture/app/modules/auth/domain/entities/credential_params_entity.dart';
import 'package:comercio_clean_architecture/app/modules/auth/domain/errors/auth_errors.dart';
import 'package:comercio_clean_architecture/app/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:comercio_clean_architecture/app/modules/auth/domain/usecases/authentication_usecase.dart';
import 'package:comercio_clean_architecture/app/shared/errors/messages.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/account_entity_mock.dart';

class MockAuthenticationRepositore extends Mock implements IAuthRepository {}

void main() {
  late AuthenticationUsecase usecase;
  late IAuthRepository repository;

  setUp(() {
    repository = MockAuthenticationRepositore();
    usecase = AuthenticationUsecase(repository: repository);
  });

  test('Dados de acesso corretos', () async {
    final tParams =
        CredentialsParamsEntity(email: 'jef10za@gmail.com', password: '123456');
    when(() {
      return repository.authenticate(params: tParams);
    }).thenAnswer((_) async => Right(tAccount));

    final result = await usecase(params: tParams);
    expect(result, Right(tAccount));
  });

  test('Email invalido', () async {
    final tParams =
        CredentialsParamsEntity(email: 'jef10za', password: '123456');
    when(() {
      return repository.authenticate(params: tParams);
    }).thenAnswer(
        (_) async => Left(AuthFailure(message: Messages.INVALID_EMAIL)));

    final result = await usecase(params: tParams);
    expect(result, Left(AuthFailure(message: Messages.INVALID_EMAIL)));
  });

  test('Password invalido', () async {
    final tParams =
        CredentialsParamsEntity(email: 'jef10za@gmail.com', password: '');
    when(() {
      return repository.authenticate(params: tParams);
    }).thenAnswer(
        (_) async => Left(AuthFailure(message: Messages.INVALID_PASSWORD)));

    final result = await usecase(params: tParams);
    expect(result, Left(AuthFailure(message: Messages.INVALID_PASSWORD)));
  });
}
