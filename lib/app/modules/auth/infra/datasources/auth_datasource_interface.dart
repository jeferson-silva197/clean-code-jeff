import 'package:comercio_clean_architecture/app/modules/auth/domain/entities/credential_params_entity.dart';
import 'package:comercio_clean_architecture/app/modules/auth/domain/entities/logged_account_entity.dart';

abstract class IAuthDatasource {
  Future<AccountEntity> authenticate({required CredentialsParamsEntity params});
}
