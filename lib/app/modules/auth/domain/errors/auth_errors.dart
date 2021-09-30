import 'package:comercio_clean_architecture/app/shared/errors/failures.dart';

class AuthFailure extends Failure {
  AuthFailure({required String message}) : super(message: message);
  List<Object?> get props => [message];
}

class ConnectionFailure extends Failure {
  ConnectionFailure({required String message}) : super(message: message);
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  ServerFailure({required String message}) : super(message: message);
  List<Object?> get props => [message];
}

class InvalidCredentialsFailure extends Failure {
  InvalidCredentialsFailure({required String message})
      : super(message: message);
  List<Object?> get props => [message];
}
