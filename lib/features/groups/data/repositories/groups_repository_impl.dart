import 'package:flutter_class_example/core/errors/failures.dart';
import 'package:flutter_class_example/core/errors/exceptions.dart';
import 'package:flutter_class_example/features/groups/data/models/group_model.dart';
import 'package:flutter_class_example/features/groups/data/datasources/groups_data_source.dart';
import 'package:flutter_class_example/features/groups/domain/repositories/groups_repository.dart';

import 'package:dartz/dartz.dart';

class GroupRepositoryImpl extends GroupsRepository {
  final GroupsDataSource groupsDataSource;

  GroupRepositoryImpl({required this.groupsDataSource});

  @override
  Future<Either<ServerFailure, bool>> createGroup(GroupModel group) async {
    try {
      return Right(
        await groupsDataSource.createGroup(group),
      );
    } on ServerException catch (e) {
      return left(
        ServerFailure(
          message: e.message,
          type: ExceptionType.groupsException,
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, bool>> deleteGroup(int groupId) async {
    try {
      return Right(
        await groupsDataSource.deleteGroup(groupId),
      );
    } on ServerException catch (e) {
      return left(
        ServerFailure(
          message: e.message,
          type: ExceptionType.groupsException,
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, List<GroupModel>>> getGroups() async {
    try {
      return Right(
        await groupsDataSource.getGroups(),
      );
    } on ServerException catch (e) {
      return left(
        ServerFailure(
          message: e.message,
          type: ExceptionType.groupsException,
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, bool>> updateGroup(GroupModel group) async {
    try {
      return Right(
        await groupsDataSource.updateGroup(group),
      );
    } on ServerException catch (e) {
      return left(
        ServerFailure(
          message: e.message,
          type: ExceptionType.groupsException,
        ),
      );
    }
  }
}
