import 'dart:convert';

import 'package:comercio_clean_architecture/app/modules/auth/domain/entities/logged_account_entity.dart';
import 'package:comercio_clean_architecture/app/modules/auth/infra/models/account_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../mocks/mocks_json.dart';

void main() {
  final tAccountModel = AccountModel(
      id: 1,
      email: 'jef10za@gmail.com',
      name: 'Jeferson Silva',
      token: 'token');
  test('AccountModel é subclasse de AccountEntity', () {
    expect(tAccountModel, isA<AccountEntity>());
  });

  test('deve retornar um modelo valido', () {
    //Arrange
    final Map<String, dynamic> jsonMap = json.decode(jsonAccount);

    //Act
    final result = AccountModel.fromMap(jsonMap);

    //
    expect(result, tAccountModel);
  });

  test('deve retornar um mapa json contendo as propriedades', () {
    final expectMap = {
      "id": 1,
      "name": "Jeferson Silva",
      "email": "jef10za@gmail.com",
      "token": "token"
    };

    final result = tAccountModel.toMap();

    expect(result, expectMap);
  });
}
