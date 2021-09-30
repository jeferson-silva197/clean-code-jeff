import 'package:comercio_clean_architecture/app/modules/business/presenter/business_module.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:comercio_clean_architecture/app/shared/http_client/http_client.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'shared/http_client/http_client_implementation.dart';
import 'shared/pages/splash_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton<IHttpClient>((i) => HttpClientImpl(httpClient: i())),
    Bind((i) => http.Client()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/authenticate/', module: BusinessModule()),
    ChildRoute(Modular.initialRoute, child: (_, __) => SplashPage()),
    ChildRoute('/home', child: (_, __) => Container(color: Colors.green)),
  ];
}
