import 'dart:convert';

import 'package:comercio_clean_architecture/app/modules/auth/domain/entities/logged_account_entity.dart';

class AccountModel extends AccountEntity {
  AccountModel(
      {required int id,
      required String email,
      required String name,
      required String token})
      : super(id: id, email: email, name: name, token: token);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'token': token,
    };
  }

  String toJson() => json.encode(toMap());

  factory AccountModel.fromMap(Map<String, dynamic> map) {
    return AccountModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      token: map['token'],
    );
  }

  factory AccountModel.fromJson(String source) =>
      AccountModel.fromMap(json.decode(source));
}
