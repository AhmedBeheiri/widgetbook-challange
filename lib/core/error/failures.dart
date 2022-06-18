import 'package:equatable/equatable.dart';

/// The failure.
abstract class Failure extends Equatable {
  /// A const constructor that creates a [Failure].
  const Failure() : super();
}

/// The server failure case.
class ServerFailure extends Failure {
  /// ServerFailure constructor.
  const ServerFailure({
    required this.errorMessage,
    required this.errorCode,
  });

  /// The error message.
  final String errorMessage;

  /// The error code.
  final int errorCode;

  @override
  List<Object> get props => [errorCode, errorMessage];
}

/// The Unexpected failure case.
class UnexpectedFailure extends Failure {
  /// UnexpectedFailure constructor.
  const UnexpectedFailure({
    required this.errorMessage,
  });

  /// The error message.
  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
