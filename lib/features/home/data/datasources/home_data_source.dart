import 'package:dio/dio.dart';

abstract class HomeDataSource {}

class HomeDataSourceImpl extends HomeDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.201.194.60:8000/api/',
    ),
  );
}
