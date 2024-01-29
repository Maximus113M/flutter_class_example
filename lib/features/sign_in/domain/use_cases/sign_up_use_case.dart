import 'package:flutter_class_example/core/errors/failures.dart';
import 'package:flutter_class_example/core/helpers/use_case.dart';
import 'package:flutter_class_example/features/sign_in/data/models/user_model.dart';
import 'package:flutter_class_example/features/sign_in/domain/repositories/sign_in_repository.dart';

import 'package:dartz/dartz.dart';

class SignUpUseCase extends UseCase<UserModel, UserModel> {
  final SignInRepository signInRepository;

  SignUpUseCase({required this.signInRepository});

  @override
  Future<Either<ServerFailure, UserModel>> call(UserModel params) async {
    return await signInRepository.signUp(params);
  }
}
