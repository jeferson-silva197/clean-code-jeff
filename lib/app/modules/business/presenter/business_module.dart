import 'package:comercio_clean_architecture/app/modules/business/domain/usecases/get_business_usecase.dart';
import 'package:comercio_clean_architecture/app/modules/business/domain/usecases/get_menu_usecase.dart';
import 'package:comercio_clean_architecture/app/modules/business/external/datasources/business_datasource_impl.dart';
import 'package:comercio_clean_architecture/app/modules/business/external/datasources/menu_datasource_impl.dart';
import 'package:comercio_clean_architecture/app/modules/business/infra/repositories/business_repository_impl.dart';
import 'package:comercio_clean_architecture/app/modules/business/infra/repositories/menu_repository_impl.dart';
import 'package:comercio_clean_architecture/app/modules/business/presenter/pages/business_page.dart';
import 'package:comercio_clean_architecture/app/modules/business/presenter/stores/bussiness_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'stores/menu_store.dart';

class BusinessModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        //Business Information
        Bind.singleton((i) => BusinessStore(getBusinessUsecase: i())),
        Bind.singleton((i) => GetBusinessUsecase(repository: i())),
        Bind.singleton((i) => BusinessRepositoryImpl(datasource: i())),
        Bind.singleton((i) => BusinessDatasourceImpl(client: i())),
        //Menu items
        Bind.singleton((i) => MenuStore(getMenuUsecase: i())),
        Bind.singleton((i) => GetMenuUsecase(repository: i())),
        Bind.singleton((i) => MenuRepository(datasource: i())),
        Bind.singleton((i) => MenuDatasourceImpl(client: i()))
      ];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (_, __) => BusinessPage())];
}
