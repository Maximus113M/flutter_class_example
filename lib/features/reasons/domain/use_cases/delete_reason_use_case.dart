import 'package:flutter_class_example/core/errors/failures.dart';
import 'package:flutter_class_example/core/helpers/use_case.dart';
import 'package:flutter_class_example/features/reasons/domain/repositories/reasons_repository.dart';

import 'package:dartz/dartz.dart';

class DeleteReasonUseCase extends UseCase<bool, int> {
  final ReasonsRepository reasonsRepository;

  DeleteReasonUseCase({required this.reasonsRepository});

  @override
  Future<Either<ServerFailure, bool>> call(int params) async {
    return await reasonsRepository.deleteReason(params);
  }
}
