import 'package:flutter_class_example/core/errors/failures.dart';
import 'package:flutter_class_example/features/groups/data/models/group_model.dart';

import 'package:dartz/dartz.dart';

abstract class GroupsRepository {
  Future<Either<ServerFailure, List<GroupModel>>> getGroups();
  Future<Either<ServerFailure, bool>> createGroup(GroupModel group);
  Future<Either<ServerFailure, bool>> updateGroup(GroupModel group);
  Future<Either<ServerFailure, bool>> deleteGroup(int groupId);
}
