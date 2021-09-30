import 'package:comercio_clean_architecture/app/modules/business/domain/entities/business_entity.dart';

abstract class IBusinessDatasource {
  Future<BusinessEntity> getInformationBusiness();
}
