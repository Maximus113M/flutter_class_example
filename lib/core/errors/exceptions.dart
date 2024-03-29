class ServerException implements Exception {
  final String message;
  final ExceptionType type;

  ServerException({
    required this.message,
    required this.type,
  });
}

enum ExceptionType {
  signinException,
  sharedException,
  reasonsException,
  homeException,
  groupsException,
}
