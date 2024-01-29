import 'package:flutter_class_example/core/errors/failures.dart';
import 'package:flutter_class_example/core/helpers/use_case.dart';
import 'package:flutter_class_example/features/sign_in/domain/repositories/sign_in_repository.dart';

import 'package:dartz/dartz.dart';

class SignOutUseCase extends UseCase<bool, NoParams> {
  final SignInRepository signInRepository;

  SignOutUseCase({required this.signInRepository});

  @override
  Future<Either<ServerFailure, bool>> call(params) async {
    return await signInRepository.signOut();
  }
}
