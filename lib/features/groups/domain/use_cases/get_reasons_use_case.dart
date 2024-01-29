import 'package:flutter_class_example/core/errors/failures.dart';
import 'package:flutter_class_example/core/helpers/use_case.dart';
import 'package:flutter_class_example/features/groups/data/models/group_model.dart';
import 'package:flutter_class_example/features/groups/domain/repositories/groups_repository.dart';

import 'package:dartz/dartz.dart';

class GetGroupsUseCase extends UseCase<List<GroupModel>, NoParams> {
  final GroupsRepository groupsRepository;

  GetGroupsUseCase({required this.groupsRepository});

  @override
  Future<Either<ServerFailure, List<GroupModel>>> call(NoParams params) async {
    return await groupsRepository.getGroups();
  }
}
