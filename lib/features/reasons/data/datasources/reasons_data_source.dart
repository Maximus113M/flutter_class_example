import 'package:dio/dio.dart';
import 'package:flutter_class_example/core/errors/exceptions.dart';
//import 'package:flutter_class_example/core/services/auth_service.dart';

import 'package:flutter_class_example/features/reasons/data/models/reasons_model.dart';

abstract class ReasonDataSource {
  Future<List<ReasonModel>> getReasons();
  Future<bool> createReason(ReasonModel reason);
  Future<bool> deleteReason(int reasonId);
}

class ReasonDataSourceImpl extends ReasonDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.201.194.60:8000/api/',
    ),
  );

  @override
  Future<List<ReasonModel>> getReasons() async {
    try {
      List<ReasonModel> reasons = [];
      //final headers = {'Authorization': 'Bearer ${AuthService.user!.token!}'};
      final Response<List> response = await dio.get('motivo', /*options: Options(headers: headers)*/);

      if (response.statusCode == 200 || response.statusCode == 201) {
        reasons = response.data!.map((e) => ReasonModel.fromJson(e)).toList();
        return reasons;
      }
      return [];
    } catch (e) {
      print(e);
      throw ServerException(
          message: 'Ha ocurrido una error al intentar obtener la informacion',
          type: ExceptionType.reasonsException);
    }
  }

  @override
  Future<bool> createReason(ReasonModel reason) async {
    try {
      final Response response =
          await dio.post('motivo', data: reason.motivoModelToJson());

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      return false;
    } on DioException catch (e) {
      print(e.error);
      throw ServerException(
          message: 'Ha ocurrido una error al intentar crear el motivo',
          type: ExceptionType.reasonsException);
    }
  }

  @override
  Future<bool> deleteReason(int reasonId) async {
    try {
      final Response response = await dio.delete('motivo/$reasonId');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      throw ServerException(
          message: 'Ha ocurrido una error al intentar eliminar el motivo',
          type: ExceptionType.reasonsException);
    }
  }
}
