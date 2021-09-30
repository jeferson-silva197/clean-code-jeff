import 'dart:convert';

import 'package:comercio_clean_architecture/app/modules/auth/domain/entities/credential_params_entity.dart';

class CredentialsParamsModel extends CredentialsParamsEntity {
  CredentialsParamsModel({required String email, required String password})
      : super(email: email, password: password);

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory CredentialsParamsModel.fromMap(Map<String, dynamic> map) {
    return CredentialsParamsModel(
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CredentialsParamsModel.fromJson(String source) =>
      CredentialsParamsModel.fromMap(json.decode(source));
}
