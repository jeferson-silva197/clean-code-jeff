import 'package:comercio_clean_architecture/app/modules/business/domain/entities/menu_entity.dart';
import 'package:comercio_clean_architecture/app/modules/business/domain/repositories/menu_repository_interface.dart';
import 'package:comercio_clean_architecture/app/modules/business/domain/usecases/get_menu_usecase.dart';
import 'package:comercio_clean_architecture/app/shared/usecases/usercase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMenuRepository extends Mock implements IMenuRepository {}

void main() {
  late IMenuRepository repository;
  late GetMenuUsecase usecase;

  final tListMenu = <MenuEntity>[
    MenuEntity(
        id: 1, image: 'image', price: 9.99, description: 'Hamburger bom'),
    MenuEntity(id: 2, image: 'image', price: 9.99, description: 'Hamburger bom')
  ];

  setUp(() {
    repository = MockMenuRepository();
    usecase = GetMenuUsecase(repository: repository);
  });

  test('deve retornar uma lista de produtos', () async {
    when(() {
      return repository.getItemsMenu();
    }).thenAnswer((_) async => Right(tListMenu));

    final result = await usecase(params: NoParams());

    expect(result, Right(tListMenu));
  });
}
