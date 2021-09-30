import 'dart:convert';

import 'package:comercio_clean_architecture/app/modules/business/domain/entities/business_entity.dart';
import 'package:comercio_clean_architecture/app/modules/business/infra/models/business_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../mocks/business_entity_mock.dart';
import '../../../../../mocks/mocks_json.dart';

void main() {
  test('deve verificar se BusinessModel é subclasse BusinessEntity', () {
    expect(tBusinessModel, isA<BusinessEntity>());
  });

  test('deve retornar um modelo', () {
    //Act
    final result = BusinessModel.fromJson(jsonBusiness);

    //
    expect(result, tBusinessModel);
  });

  test('deve retornar um mapa json contendo as propriedades', () {
    final jsonToMap = json.decode(jsonBusiness);
    final result = tBusinessModel.toMap();

    expect(result, jsonToMap);
  });
}
