import 'package:dio/dio.dart';
import 'package:flutter_class_example/features/home/data/models/motivos_model.dart';

abstract class HomeDataSource {
  Future<List> getMotivos();
  Future<bool> createMotivo(MotivosModel motivoModel);
  Future<List> getAprendices();
}

class HomeDataSourceImpl extends HomeDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
    ),
  );

  @override
  Future<List> getAprendices() async {
    final Response response = await dio.get('motivos');

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    }
    return [];
  }

  @override
  Future<List> getMotivos() {
    // TODO: implement getMotivos
    throw UnimplementedError();
  }

  @override
  Future<bool> createMotivo(MotivosModel motivoModel) {
    // TODO: implement createMotivo
    throw UnimplementedError();
  }
}
