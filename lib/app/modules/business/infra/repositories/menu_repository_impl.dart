import 'package:comercio_clean_architecture/app/modules/business/domain/entities/menu_entity.dart';
import 'package:comercio_clean_architecture/app/modules/business/domain/errors/business_errors.dart';
import 'package:comercio_clean_architecture/app/modules/business/domain/repositories/menu_repository_interface.dart';
import 'package:comercio_clean_architecture/app/modules/business/infra/datasources/menu_datasource_interface.dart';
import 'package:comercio_clean_architecture/app/shared/errors/exceptions.dart';
import 'package:comercio_clean_architecture/app/shared/errors/messages.dart';
import 'package:dartz/dartz.dart';
import 'package:comercio_clean_architecture/app/shared/errors/failures.dart';

class MenuRepository implements IMenuRepository {
  final IMenuDatasource datasource;
  MenuRepository({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<MenuEntity>>> getItemsMenu() async {
    try {
      final result = await datasource.getItemsMenu();
      return Right(result);
    } on NotFoundException {
      return Left(NotFoundFailure(message: Messages.NOT_FOUND));
    } on ServerException {
      return Left(ServerFailure(message: Messages.SERVER_FAIL_REQUEST));
    }
  }
}
