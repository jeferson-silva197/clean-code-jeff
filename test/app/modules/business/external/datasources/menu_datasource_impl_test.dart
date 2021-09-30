import 'package:comercio_clean_architecture/app/modules/business/domain/entities/menu_entity.dart';
import 'package:comercio_clean_architecture/app/modules/business/external/datasources/menu_datasource_impl.dart';
import 'package:comercio_clean_architecture/app/modules/business/infra/models/menu_model.dart';
import 'package:comercio_clean_architecture/app/shared/errors/exceptions.dart';
import 'package:comercio_clean_architecture/app/shared/http_client/http_client.dart';
import 'package:comercio_clean_architecture/app/shared/utils/api_base/url_base_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/mocks_json.dart';

class MockHttpClient extends Mock implements IHttpClient {}

void main() {
  late IHttpClient client;
  late MenuDatasourceImpl datasource;

  setUp(() {
    client = MockHttpClient();
    datasource = MenuDatasourceImpl(client: client);
  });

  final urlExpect = '${BaseApi.url}/menu';

  void successMock() {
    when(() => client.get(path: urlExpect))
        .thenAnswer((_) async => HttpResponse(data: jsonMenu, statusCode: 200));
  }

  test('deve retornar o metodo correto para get menu', () async {
    successMock();

    await datasource.getItemsMenu();

    verify(() => client.get(path: urlExpect)).called(1);
  });

  test('deve retorna um BusinessModel se for sucesso!', () async {
    successMock();
    final tMenuModel = MenuModel(
        id: 1,
        image:
            'https://cdn.freebiesupply.com/images/thumbs/2x/burger-king-logo.png',
        price: 10.99,
        description:
            'Hamburger de 150g com queijo, alface e cebola caramelizada');

    final tListMenu = <MenuEntity>[
      tMenuModel,
      tMenuModel,
      tMenuModel,
      tMenuModel
    ];

    final result = await datasource.getItemsMenu();

    expect(result, tListMenu);
  });

  test('deve retornar um erro Exception 500 do servidor ao buscar o menu',
      () async {
    when(() => client.get(path: urlExpect))
        .thenAnswer((_) async => HttpResponse(data: '', statusCode: 500));

    final result = datasource.getItemsMenu();

    expect(() => result, throwsA(ServerException()));
  });
}
