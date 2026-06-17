import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}
// Specific Failures
class ServerFailure extends Failure {
  final int? statusCode;
  const ServerFailure(super.message, {this.statusCode});

  @override
  List<Object> get props => [message, statusCode ?? -1];
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);

  @override
  List<Object> get props => super.props;
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);

  @override
  List<Object> get props => [message];
}
