import 'package:comercio_clean_architecture/app/modules/business/external/datasources/business_datasource_impl.dart';
import 'package:comercio_clean_architecture/app/modules/business/infra/datasources/business_datasource_interface.dart';
import 'package:comercio_clean_architecture/app/modules/business/infra/models/business_model.dart';
import 'package:comercio_clean_architecture/app/shared/errors/exceptions.dart';
import 'package:comercio_clean_architecture/app/shared/http_client/http_client.dart';
import 'package:comercio_clean_architecture/app/shared/utils/api_base/url_base_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../mocks/mocks_json.dart';

class HttpClientMock extends Mock implements IHttpClient {}

void main() {
  late IBusinessDatasource datasource;
  late IHttpClient client;

  setUp(() {
    client = HttpClientMock();
    datasource = BusinessDatasourceImpl(client: client);
  });

  final urlExpect = '${BaseApi.url}/business';

  void successMock() {
    when(() => client.get(path: urlExpect)).thenAnswer(
        (_) async => HttpResponse(data: jsonBusiness, statusCode: 200));
  }

  test('deve retornar o metodo correto', () async {
    successMock();

    await datasource.getInformationBusiness();

    verify(() => client.get(path: urlExpect)).called(1);
  });

  test('deve retorna um BusinessModel se for sucesso!', () async {
    successMock();
    final tBusinessModel = BusinessModel(
        name: 'Jefs Burger',
        description: 'O melhor hamburger',
        image: 'imagem');

    final result = await datasource.getInformationBusiness();

    expect(result, tBusinessModel);
  });

  test('deve retornar um erro Exception 500 do servidor ao buscar o business',
      () async {
    when(() => client.get(path: urlExpect))
        .thenAnswer((_) async => HttpResponse(data: '', statusCode: 500));

    final result = datasource.getInformationBusiness();

    expect(() => result, throwsA(ServerException()));
  });
}
