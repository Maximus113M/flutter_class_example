import 'package:flutter_class_example/features/home/data/models/motivos_model.dart';

abstract class MotivoRepository{
  Future<List<MotivosModel>> getMotivos();
  Future<bool> createMotivo(MotivosModel motivoModel);
  Future<bool> deleteMotivo(int motivoId);
  Future<List> getFichas();
  Future<List> getByIdFichas();
  Future<List> createFichas();
  Future<List> deleteFichas();
  Future<List> updateteFichas();
}