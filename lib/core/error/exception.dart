/// Server Exception case.
class ServerException implements Exception {
  /// Server Exception constructor.
  const ServerException(this.errorMessage, this.errorCode);

  /// Error message.
  final String errorMessage;

  /// Error code.
  final int errorCode;
}
