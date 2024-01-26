import 'package:flutter_class_example/features/home/data/models/motivos_model.dart';
import 'package:flutter_class_example/features/home/domain/repositories/motivo_repository.dart';

class GetMotivosUseCase {
  final MotivoRepository homeRepository;

  const GetMotivosUseCase({required this.homeRepository});

  Future<List<MotivosModel>> getMotivos() async {
    return await homeRepository.getMotivos();
  }
}
