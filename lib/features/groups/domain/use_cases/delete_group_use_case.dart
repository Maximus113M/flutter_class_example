import 'package:flutter_class_example/core/errors/failures.dart';
import 'package:flutter_class_example/core/helpers/use_case.dart';
import 'package:flutter_class_example/features/groups/domain/repositories/groups_repository.dart';

import 'package:dartz/dartz.dart';

class DeleteGroupUseCase extends UseCase<bool, int> {
  final GroupsRepository groupsRepository;

  DeleteGroupUseCase({required this.groupsRepository});

  @override
  Future<Either<ServerFailure, bool>> call(int params) async {
    return await groupsRepository.deleteGroup(params);
  }
}
