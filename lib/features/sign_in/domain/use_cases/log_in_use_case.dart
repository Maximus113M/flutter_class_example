import 'package:flutter_class_example/core/errors/failures.dart';
import 'package:flutter_class_example/core/helpers/use_case.dart';
import 'package:flutter_class_example/features/sign_in/data/models/user_model.dart';
import 'package:flutter_class_example/features/sign_in/data/models/sign_in_model.dart';
import 'package:flutter_class_example/features/sign_in/domain/repositories/sign_in_repository.dart';

import 'package:dartz/dartz.dart';

class LogInUseCase extends UseCase<UserModel, SignInDataModel> {
  final SignInRepository reasonsRepository;

  LogInUseCase({required this.reasonsRepository});

  @override
  Future<Either<ServerFailure, UserModel>> call(SignInDataModel params) async {
    return await reasonsRepository.logIn(params);
  }
}
