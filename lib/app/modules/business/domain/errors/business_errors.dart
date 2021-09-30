import 'package:comercio_clean_architecture/app/shared/errors/failures.dart';

class NotFoundFailure extends Failure {
  NotFoundFailure({required String message}) : super(message: message);
  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  ServerFailure({required String message}) : super(message: message);
  List<Object?> get props => [message];
}
