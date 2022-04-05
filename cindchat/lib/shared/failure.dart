import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(String message) : super(message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(String message) : super(message);
}

class UnknownFailure extends Failure {
  const UnknownFailure(String message) : super(message);
}

class FailureHandler {
  static Failure identifyFailure(Object e) {
    if (e is DatabaseFailure) {
      return e;
    }
    if (e is ServerFailure) {
      return e;
    }
    if (e is Exception) {
      return UnknownFailure(e.toString());
    }
    return const UnknownFailure("Uknown Failure");
  }
}
