import 'package:flutter_class_example/core/errors/failures.dart';
import 'package:flutter_class_example/core/helpers/use_case.dart';
import 'package:flutter_class_example/features/reasons/data/models/reasons_model.dart';
import 'package:flutter_class_example/features/reasons/domain/repositories/reasons_repository.dart';

import 'package:dartz/dartz.dart';

class GetReasonsUseCase extends UseCase<List<ReasonModel>, NoParams> {
  final ReasonsRepository reasonsRepository;

  GetReasonsUseCase({required this.reasonsRepository});

  @override
  Future<Either<ServerFailure, List<ReasonModel>>> call(NoParams params) async {
    return await reasonsRepository.getReasons();
  }
}
