import 'package:flutter_class_example/core/errors/exceptions.dart';

abstract class Failure {}

class ServerFailure implements Failure {
  final String message;
  final ExceptionType type;

  ServerFailure({
    required this.message,
    required this.type,
  });
}
