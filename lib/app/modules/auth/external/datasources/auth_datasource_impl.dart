import 'package:comercio_clean_architecture/app/modules/auth/domain/entities/credential_params_entity.dart';
import 'package:comercio_clean_architecture/app/modules/auth/domain/entities/logged_account_entity.dart';
import 'package:comercio_clean_architecture/app/modules/auth/external/datasources/endpoints/auth_endpoints.dart';
import 'package:comercio_clean_architecture/app/modules/auth/infra/datasources/auth_datasource_interface.dart';
import 'package:comercio_clean_architecture/app/modules/auth/infra/models/account_model.dart';
import 'package:comercio_clean_architecture/app/modules/auth/infra/models/credentials_model.dart';

import 'package:comercio_clean_architecture/app/shared/errors/exceptions.dart';
import 'package:comercio_clean_architecture/app/shared/http_client/http_client.dart';

class AuthDatasourceImpl implements IAuthDatasource {
  final IHttpClient client;
  AuthDatasourceImpl({
    required this.client,
  });

  @override
  Future<AccountEntity> authenticate(
      {required CredentialsParamsEntity params}) async {
    final CredentialsParamsModel model =
        CredentialsParamsModel(email: params.email, password: params.password);

    final response =
        await client.post(path: AuthEndPoints.auth, data: model.toMap());

    switch (response.statusCode) {
      case 200:
        return AccountModel.fromJson(response.data);
      case 401:
        throw InvalidCredentialsException();
      default:
        throw ServerException();
    }
  }
}
