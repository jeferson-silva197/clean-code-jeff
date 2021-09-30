import 'package:flutter_triple/flutter_triple.dart';
import 'package:string_validator/string_validator.dart';

class BodyFormularyValidationStore {
  final RxNotifier<String> _email = RxNotifier<String>('');
  final RxNotifier<String> _password = RxNotifier<String>('');

  setEmail(String value) => _email.value = value;
  setPassword(String value) => _password.value = value;

  String get email => _email.value;
  String get password => _password.value;

  bool get isValidate => isEmail(_email.value) && _password.value.length >= 6;
}
