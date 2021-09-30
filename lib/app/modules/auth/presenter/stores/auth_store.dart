import 'package:flutter_triple/flutter_triple.dart';

import 'package:comercio_clean_architecture/app/modules/auth/domain/entities/credential_params_entity.dart';
import 'package:comercio_clean_architecture/app/modules/auth/domain/entities/logged_account_entity.dart';
import 'package:comercio_clean_architecture/app/modules/auth/domain/usecases/authentication_usecase.dart';
import 'package:comercio_clean_architecture/app/modules/auth/presenter/stores/body_store.dart';

class AuthStore extends NotifierStore<String, AccountEntity> {
  AuthStore({
    required this.authenticateUsecase,
    required this.bodyValidationStore,
  }) : super(AccountEntity(email: '', id: null, name: '', token: ''));

  final AuthenticationUsecase authenticateUsecase;
  final BodyFormularyValidationStore bodyValidationStore;

  void authenticate() async {
    setError('');
    setLoading(true);
    final result = await authenticateUsecase(
        params: CredentialsParamsEntity(
            email: bodyValidationStore.email,
            password: bodyValidationStore.password));
    result.fold((l) => setError(l.message, force: true), (r) => update(r));
    setLoading(false);
  }
}
