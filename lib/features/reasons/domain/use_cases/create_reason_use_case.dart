import 'package:flutter_class_example/core/errors/failures.dart';
import 'package:flutter_class_example/core/helpers/use_case.dart';
import 'package:flutter_class_example/features/reasons/data/models/reasons_model.dart';
import 'package:flutter_class_example/features/reasons/domain/repositories/reasons_repository.dart';

import 'package:dartz/dartz.dart';

class CreateReasonsUseCase extends UseCase<bool, ReasonModel> {
  final ReasonsRepository reasonsRepository;

  CreateReasonsUseCase({required this.reasonsRepository});

  @override
  Future<Either<ServerFailure, bool>> call(params) async {
    return await reasonsRepository.createReason(params);
  }
}
