import 'package:flutter_class_example/features/home/data/datasources/home_data_source.dart';
import 'package:flutter_class_example/features/home/domain/repositories/motivo_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDataSource homeDataSource;

  HomeRepositoryImpl({required this.homeDataSource});
}
