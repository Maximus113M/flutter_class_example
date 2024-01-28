import 'package:flutter_class_example/core/errors/failures.dart';
import 'package:flutter_class_example/core/errors/exceptions.dart';
import 'package:flutter_class_example/features/reasons/data/models/reasons_model.dart';
import 'package:flutter_class_example/features/reasons/data/datasources/reasons_data_source.dart';
import 'package:flutter_class_example/features/reasons/domain/repositories/reasons_repository.dart';

import 'package:dartz/dartz.dart';

class ReasonsRepositoryImpl extends ReasonsRepository {
  final ReasonDataSource reasonDataSource;

  ReasonsRepositoryImpl({required this.reasonDataSource});

  @override
  Future<Either<ServerFailure, bool>> createReason(ReasonModel reason) async {
    try {
      return Right(await reasonDataSource.createReason(reason));
    } on ServerException catch (e) {
      return left(
        ServerFailure(
          message: e.message,
          type: ExceptionType.reasonsException,
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, bool>> deleteReason(int reasonId) async {
    try {
      return Right(await reasonDataSource.deleteReason(reasonId));
    } on ServerException catch (e) {
      return left(
        ServerFailure(
          message: e.message,
          type: ExceptionType.reasonsException,
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, List<ReasonModel>>> getReasons() async {
    try {
      return Right(await reasonDataSource.getReasons());
    } on ServerException catch (e) {
      return left(
        ServerFailure(
          message: e.message,
          type: ExceptionType.reasonsException,
        ),
      );
    }
  }
}
