import 'package:dio/dio.dart';
import 'package:flutter_class_example/features/home/data/models/motivos_model.dart';

abstract class HomeDataSource {
  Future<List<MotivosModel>> getMotivos();
  Future<bool> createMotivo(MotivosModel motivoModel);
  Future<bool> deleteMotivo(int motivoId);
  Future<List> getAprendices();
}

class HomeDataSourceImpl extends HomeDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.201.194.60:8000/api/',
    ),
  );

  @override
  Future<List> getAprendices() async {
    return [];
  }

  @override
  Future<List<MotivosModel>> getMotivos() async {
    try {
      List<MotivosModel> motivos = [];
      final Response<List> response = await dio.get('motivo');

      if (response.statusCode == 200 || response.statusCode == 201) {
        motivos = response.data!.map((e) => MotivosModel.fromJson(e)).toList();
        return motivos;
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<bool> createMotivo(MotivosModel motivoModel) async {
    try {
      final Response response =
          await dio.post('motivo', data: {"nombre": motivoModel.name});

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      return false;
    } on DioException catch (e) {
      print(e.error);
      return false;
    }
  }

  @override
  Future<bool> deleteMotivo(int motivoId) async {
    try {
      final Response response = await dio.delete('motivo/$motivoId');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
