import 'package:comercio_clean_architecture/app/modules/business/domain/entities/business_entity.dart';
import 'package:comercio_clean_architecture/app/modules/business/domain/repositories/business_repository_interface.dart';
import 'package:comercio_clean_architecture/app/modules/business/domain/usecases/get_business_usecase.dart';
import 'package:comercio_clean_architecture/app/shared/usecases/usercase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class MockBusinessRepository extends Mock implements IBusinessRepository {}

void main() {
  late IBusinessRepository repository;
  late GetBusinessUsecase usecase;
  setUp(() {
    repository = MockBusinessRepository();
    usecase = GetBusinessUsecase(repository: repository);
  });

  final tBusiness = BusinessEntity(
      name: 'Jefs Burger', description: 'Melhor restauranet', image: 'imagem');

  test('Deve retornar um restaurante', () async {
    when(() {
      return repository.getBusinessInformation();
    }).thenAnswer((_) async => Right(tBusiness));

    final result = await usecase(params: NoParams());

    expect(result, Right(tBusiness));
  });
}
