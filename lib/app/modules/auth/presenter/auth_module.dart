import 'package:comercio_clean_architecture/app/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:comercio_clean_architecture/app/modules/auth/domain/usecases/authentication_usecase.dart';
import 'package:comercio_clean_architecture/app/modules/auth/external/datasources/auth_datasource_impl.dart';
import 'package:comercio_clean_architecture/app/modules/auth/infra/datasources/auth_datasource_interface.dart';
import 'package:comercio_clean_architecture/app/modules/auth/infra/repositories/auth_repository_impl.dart';
import 'package:comercio_clean_architecture/app/modules/auth/presenter/pages/auth_page.dart';
import 'package:comercio_clean_architecture/app/modules/auth/presenter/stores/auth_store.dart';
import 'package:comercio_clean_architecture/app/modules/auth/presenter/stores/body_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) =>
            AuthStore(authenticateUsecase: i(), bodyValidationStore: i())),
        Bind.lazySingleton((i) => BodyFormularyValidationStore()),
        Bind.singleton((i) => AuthenticationUsecase(repository: i())),
        Bind.singleton<IAuthRepository>(
            (i) => AuthRepositoryImpl(datasource: i())),
        Bind.singleton<IAuthDatasource>((i) => AuthDatasourceImpl(client: i()))
      ];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (_, __) => AuthPage())];
}
