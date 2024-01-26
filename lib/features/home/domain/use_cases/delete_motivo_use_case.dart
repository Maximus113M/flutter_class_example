import 'package:flutter_class_example/features/home/domain/repositories/motivo_repository.dart';

class DeleteMotivoUseCase {
  final MotivoRepository homeRepository;

  const DeleteMotivoUseCase({required this.homeRepository});

  Future<bool> deleteMotivo(int id) async {
    return await homeRepository.deleteMotivo(id);
  }
}
