import 'package:comercio_clean_architecture/app/modules/business/domain/errors/business_errors.dart';
import 'package:comercio_clean_architecture/app/modules/business/infra/datasources/business_datasource_interface.dart';
import 'package:comercio_clean_architecture/app/modules/business/infra/repositories/business_repository_impl.dart';
import 'package:comercio_clean_architecture/app/shared/errors/exceptions.dart';
import 'package:comercio_clean_architecture/app/shared/errors/messages.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/business_entity_mock.dart';

class MockBusinessDatasource extends Mock implements IBusinessDatasource {}

void main() {
  late BusinessRepositoryImpl repository;
  late IBusinessDatasource datasource;

  setUp(() {
    datasource = MockBusinessDatasource();
    repository = BusinessRepositoryImpl(datasource: datasource);
  });

  test('deve retornar o model do business!', () async {
    when(() => datasource.getInformationBusiness())
        .thenAnswer((_) async => tBusinessModel);

    final result = await repository.getBusinessInformation();
    expect(result, Right(tBusinessModel));
  });

  test('Falha no Servidor ao buscar business', () async {
    when(() => datasource.getInformationBusiness())
        .thenThrow(ServerException());

    final result = await repository.getBusinessInformation();
    expect(result, Left(ServerFailure(message: Messages.SERVER_FAIL_REQUEST)));
  });

  test(
      'deve retornar Dados não encontrados ao buscar um negocio que nao existe',
      () async {
    when(() => datasource.getInformationBusiness())
        .thenThrow(NotFoundException());

    final result = await repository.getBusinessInformation();
    expect(result, Left(NotFoundFailure(message: Messages.NOT_FOUND)));
  });
}
