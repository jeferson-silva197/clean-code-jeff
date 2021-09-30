import 'package:dartz/dartz.dart';

import 'package:comercio_clean_architecture/app/modules/business/domain/entities/menu_entity.dart';
import 'package:comercio_clean_architecture/app/modules/business/domain/repositories/menu_repository_interface.dart';
import 'package:comercio_clean_architecture/app/shared/errors/failures.dart';
import 'package:comercio_clean_architecture/app/shared/usecases/usercase.dart';

class GetMenuUsecase implements Usecase<List<MenuEntity>, NoParams> {
  final IMenuRepository repository;
  GetMenuUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<MenuEntity>>> call(
      {required NoParams params}) async {
    return await repository.getItemsMenu();
  }
}
