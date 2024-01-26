import 'package:flutter_class_example/features/home/data/datasources/home_data_source.dart';
import 'package:flutter_class_example/features/home/data/models/motivos_model.dart';
import 'package:flutter_class_example/features/home/domain/repositories/motivo_repository.dart';

class MotivoRepositoryImpl extends MotivoRepository {
  final HomeDataSource homeDataSource;

  MotivoRepositoryImpl({required this.homeDataSource});

  @override
  Future<bool> createMotivo(MotivosModel motivoModel) async {
    return await homeDataSource.createMotivo(motivoModel);
  }

  @override
  Future<bool> deleteMotivo(int motivoId) async{
      return await homeDataSource.deleteMotivo(motivoId);
  }

  @override
  Future<List<MotivosModel>> getMotivos() async {
    return await homeDataSource.getMotivos();
  }
  
  @override
  Future<List> createFichas() {
    // TODO: implement createFichas
    throw UnimplementedError();
  }
  
  @override
  Future<List> deleteFichas() {
    // TODO: implement deleteFichas
    throw UnimplementedError();
  }
  
  @override
  Future<List> getByIdFichas() {
    // TODO: implement getByIdFichas
    throw UnimplementedError();
  }
  
  @override
  Future<List> getFichas() {
    // TODO: implement getFichas
    throw UnimplementedError();
  }
  
  @override
  Future<List> updateteFichas() {
    // TODO: implement updateteFichas
    throw UnimplementedError();
  }
}
