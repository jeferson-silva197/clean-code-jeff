import 'package:comercio_clean_architecture/app/modules/business/domain/entities/menu_entity.dart';

abstract class IMenuDatasource {
  Future<List<MenuEntity>> getItemsMenu();
}
