import 'package:comercio_clean_architecture/app/shared/usecases/usercase.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'package:comercio_clean_architecture/app/modules/business/domain/entities/business_entity.dart';
import 'package:comercio_clean_architecture/app/modules/business/domain/usecases/get_business_usecase.dart';
import 'package:comercio_clean_architecture/app/shared/errors/failures.dart';

class BusinessStore extends NotifierStore<Failure, BusinessEntity> {
  BusinessStore({required this.getBusinessUsecase})
      : super(BusinessEntity(
            name: 'name', description: 'description', image: 'image')) {
    fetchBusiness();
  }

  final GetBusinessUsecase getBusinessUsecase;

  fetchBusiness() async {
    setLoading(true);
    final result = await getBusinessUsecase(params: NoParams());
    result.fold((l) => setError(l), (r) => update(r));
    setLoading(false);
  }
}
