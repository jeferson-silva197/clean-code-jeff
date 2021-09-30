import 'package:comercio_clean_architecture/app/modules/auth/external/datasources/auth_datasource_impl.dart';
import 'package:comercio_clean_architecture/app/modules/auth/infra/datasources/auth_datasource_interface.dart';
import 'package:comercio_clean_architecture/app/modules/auth/infra/models/account_model.dart';
import 'package:comercio_clean_architecture/app/modules/auth/infra/models/credentials_model.dart';
import 'package:comercio_clean_architecture/app/shared/errors/exceptions.dart';
import 'package:comercio_clean_architecture/app/shared/http_client/http_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/mocks_json.dart';

class HttpClientMock extends Mock implements IHttpClient {}

void main() {
  late IAuthDatasource datasource;
  late IHttpClient client;

  final tParams =
      CredentialsParamsModel(email: 'jef10za@gmail.com', password: '123456');
  setUp(() {
    client = HttpClientMock();
    datasource = AuthDatasourceImpl(client: client);
  });

  final urlExpect = 'http://localhost:3000/authentication';

  void successMock() {
    when(() => client.post(path: urlExpect, data: tParams.toMap())).thenAnswer(
        (_) async => HttpResponse(data: jsonAccount, statusCode: 200));
  }

  test('deve retornar o metodo correto', () async {
    successMock();

    await datasource.authenticate(params: tParams);

    verify(() => client.post(path: urlExpect, data: tParams.toMap())).called(1);
  });

  test('deve retorna um AccountModel se for sucesso!', () async {
    successMock();
    final tAccountModel = AccountModel(
        id: 1,
        name: 'Jeferson Silva',
        email: 'jef10za@gmail.com',
        token: "token");

    final result = await datasource.authenticate(params: tParams);

    expect(result, tAccountModel);
  });

  test('should throw a ServerException when the call is unsuccessful',
      () async {
    when(() => client.post(path: urlExpect, data: tParams.toMap())).thenAnswer(
        (invocation) async => HttpResponse(data: '', statusCode: 500));

    final result = datasource.authenticate(params: tParams);

    expect(() => result, throwsA(ServerException()));
  });
}
