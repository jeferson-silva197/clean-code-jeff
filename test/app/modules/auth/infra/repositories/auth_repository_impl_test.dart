import 'package:comercio_clean_architecture/app/modules/auth/domain/entities/credential_params_entity.dart';
import 'package:comercio_clean_architecture/app/modules/auth/domain/errors/auth_errors.dart';
import 'package:comercio_clean_architecture/app/modules/auth/infra/datasources/auth_datasource_interface.dart';
import 'package:comercio_clean_architecture/app/modules/auth/infra/repositories/auth_repository_impl.dart';
import 'package:comercio_clean_architecture/app/shared/errors/exceptions.dart';
import 'package:comercio_clean_architecture/app/shared/errors/messages.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/account_entity_mock.dart';

class MockAuthDatasource extends Mock implements IAuthDatasource {}

void main() {
  late AuthRepositoryImpl repository;
  late IAuthDatasource datasource;

  final tParams = CredentialsParamsEntity(email: 'jef10za', password: '123456');

  setUp(() {
    datasource = MockAuthDatasource();
    repository = AuthRepositoryImpl(datasource: datasource);
  });

  test('Retorna o model do usuario logado!', () async {
    when(() => datasource.authenticate(params: tParams))
        .thenAnswer((_) async => tAccount);

    final result = await repository.authenticate(params: tParams);
    expect(result, Right(tAccount));
  });

  test('Falha no Servidor', () async {
    when(() => datasource.authenticate(params: tParams))
        .thenThrow(ServerException());

    final result = await repository.authenticate(params: tParams);
    expect(result, Left(ServerFailure(message: Messages.SERVER_FAIL_REQUEST)));
  });

  test('Credenciais Inválidas', () async {
    when(() => datasource.authenticate(params: tParams))
        .thenThrow(InvalidCredentialsException());

    final result = await repository.authenticate(params: tParams);
    expect(result,
        Left(InvalidCredentialsFailure(message: Messages.INVALID_CREDENTIALS)));
  });
}
