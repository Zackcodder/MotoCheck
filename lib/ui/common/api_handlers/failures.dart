/// This file contains failures
abstract class Failure {}

class ServerFailure implements Failure {
  final String? errorMessage;
  ServerFailure({this.errorMessage});
}

class InputFailure implements Failure {
  final String? errorMessage;
  InputFailure({required this.errorMessage});
}

class BadAuthFailure implements Failure {
  final String? errorMessage;
  BadAuthFailure({this.errorMessage});
}

class NetworkFailure implements Failure {
  final String? errorMessage;
  NetworkFailure({this.errorMessage});
}

class UnknownFailure implements Failure {
  final String? errorMessage;
  UnknownFailure({this.errorMessage});
}
