import 'dart:convert';

import 'package:comercio_clean_architecture/app/modules/business/domain/entities/menu_entity.dart';
import 'package:comercio_clean_architecture/app/modules/business/external/datasources/endpoints/menu_endpoints.dart';
import 'package:comercio_clean_architecture/app/modules/business/infra/datasources/menu_datasource_interface.dart';
import 'package:comercio_clean_architecture/app/modules/business/infra/models/menu_model.dart';
import 'package:comercio_clean_architecture/app/shared/errors/exceptions.dart';
import 'package:comercio_clean_architecture/app/shared/http_client/http_client.dart';

class MenuDatasourceImpl implements IMenuDatasource {
  final IHttpClient client;
  MenuDatasourceImpl({
    required this.client,
  });

  @override
  Future<List<MenuEntity>> getItemsMenu() async {
    final response = await client.get(path: MenuEndpoints.menu);
    switch (response.statusCode) {
      case 200:
        var list = json.decode(response.data);
        return (list['products'] as List)
            .map((e) => MenuModel.fromMap(e))
            .toList();
      case 404:
        throw NotFoundException();

      default:
        throw ServerException();
    }
  }
}
