import 'package:comercio_clean_architecture/app/modules/business/domain/entities/menu_entity.dart';
import 'package:comercio_clean_architecture/app/shared/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class IMenuRepository {
  Future<Either<Failure, List<MenuEntity>>> getItemsMenu();
}
