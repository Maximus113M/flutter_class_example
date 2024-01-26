import 'package:flutter_class_example/features/home/data/models/motivos_model.dart';

abstract class MotivoRepository{
  Future<List> getFichas();
  Future<List> getByIdFichas(int id);
  Future<List> createFichas();
  Future<List> deleteFichas();
  Future<List> updateteFichas();
}