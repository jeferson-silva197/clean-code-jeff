import 'package:comercio_clean_architecture/app/modules/business/domain/entities/menu_entity.dart';
import 'package:comercio_clean_architecture/app/modules/business/domain/usecases/get_menu_usecase.dart';
import 'package:comercio_clean_architecture/app/shared/errors/failures.dart';
import 'package:comercio_clean_architecture/app/shared/usecases/usercase.dart';
import 'package:flutter_triple/flutter_triple.dart';

class MenuStore extends NotifierStore<Failure, List<MenuEntity>> {
  MenuStore({required this.getMenuUsecase}) : super(<MenuEntity>[]) {
    fetchMenu();
  }
  final GetMenuUsecase getMenuUsecase;

  fetchMenu() async {
    setLoading(true);
    final result = await getMenuUsecase(params: NoParams());
    result.fold((l) => setError(l), (r) => update(r));
    setLoading(false);
  }
}
