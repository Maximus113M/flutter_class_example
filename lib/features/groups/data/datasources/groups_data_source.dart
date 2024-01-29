import 'package:dio/dio.dart';
import 'package:flutter_class_example/core/errors/exceptions.dart';
import 'package:flutter_class_example/features/groups/data/models/group_model.dart';

abstract class GroupsDataSource {
  Future<List<GroupModel>> getGroups();
  Future<bool> createGroup(GroupModel group);
  Future<bool> updateGroup(GroupModel group);
  Future<bool> deleteGroup(int groupId);
}

class GroupsDataSourceImpl extends GroupsDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.201.194.60:8000/api/',
    ),
  );

  @override
  Future<List<GroupModel>> getGroups() async {
    try {
      List<GroupModel> groups = [];
      final Response<List> response = await dio.get('motivo');

      if (response.statusCode == 200) {
        groups = response.data!
            .map((groupJson) => GroupModel.fromJson(groupJson))
            .toList();
        return groups;
      }
      return [];
    } catch (e) {
      throw ServerException(
          message: 'Ha ocurrido una error al intentar obtener la informacion',
          type: ExceptionType.groupsException);
    }
  }

  @override
  Future<bool> createGroup(GroupModel group) async {
    try {
      final Response response =
          await dio.post('ficha', data: group.groupModelToJson());

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      throw ServerException(
          message: 'Ha ocurrido una error al intentar crear la ficha',
          type: ExceptionType.groupsException);
    }
  }

  @override
  Future<bool> updateGroup(GroupModel group) async {
    try {
      final Response response =
          await dio.put('ficha/${group.id}', data: group.groupModelToJson());

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      throw ServerException(
          message: 'Ha ocurrido una error al intentar actualizar la ficha',
          type: ExceptionType.groupsException);
    }
  }

  @override
  Future<bool> deleteGroup(int groupId) async {
    try {
      final Response response = await dio.delete('ficha/$groupId');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      throw ServerException(
          message: 'Ha ocurrido una error al intentar eliminar la ficha',
          type: ExceptionType.groupsException);
    }
  }
}
