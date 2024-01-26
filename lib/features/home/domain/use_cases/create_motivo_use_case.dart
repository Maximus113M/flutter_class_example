import 'package:flutter_class_example/features/home/data/models/motivos_model.dart';
import 'package:flutter_class_example/features/home/domain/repositories/motivo_repository.dart';

class CreateMotivoUseCase {
  final MotivoRepository homeRepository;

  const CreateMotivoUseCase({required this.homeRepository});

  Future<bool> createMotivo(MotivosModel motivo) async {
    return await homeRepository.createMotivo(motivo);
  }
}
