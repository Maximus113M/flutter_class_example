import 'package:flutter_class_example/core/errors/failures.dart';
import 'package:flutter_class_example/features/reasons/data/models/reasons_model.dart';

import 'package:dartz/dartz.dart';

abstract class ReasonsRepository {
  Future<Either<ServerFailure, List<ReasonModel>>> getReasons();
  Future<Either<ServerFailure, bool>> createReason(ReasonModel reason);
  Future<Either<ServerFailure, bool>> deleteReason(int reasonId);
}
