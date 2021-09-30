import 'package:comercio_clean_architecture/app/modules/business/domain/entities/business_entity.dart';
import 'package:comercio_clean_architecture/app/modules/business/external/datasources/endpoints/business_endpoints.dart';
import 'package:comercio_clean_architecture/app/modules/business/infra/datasources/business_datasource_interface.dart';
import 'package:comercio_clean_architecture/app/modules/business/infra/models/business_model.dart';
import 'package:comercio_clean_architecture/app/shared/errors/exceptions.dart';
import 'package:comercio_clean_architecture/app/shared/http_client/http_client.dart';

import 'endpoints/business_endpoints.dart';

class BusinessDatasourceImpl implements IBusinessDatasource {
  final IHttpClient client;
  BusinessDatasourceImpl({
    required this.client,
  });
  @override
  Future<BusinessEntity> getInformationBusiness() async {
    final response = await client.get(path: BusinessEndpoints.getBusiness);

    switch (response.statusCode) {
      case 200:
        return BusinessModel.fromJson(response.data);
      case 404:
        throw NotFoundException();
      default:
        throw ServerException();
    }
  }
}
