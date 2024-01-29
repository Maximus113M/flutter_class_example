import 'package:flutter_class_example/core/errors/failures.dart';
import 'package:flutter_class_example/features/sign_in/data/models/sign_in_model.dart';
import 'package:flutter_class_example/features/sign_in/data/models/user_model.dart';

import 'package:dartz/dartz.dart';

abstract class SignInRepository {
  Future<Either<ServerFailure, UserModel>> logIn(SignInDataModel signInDataModel);
  Future<Either<ServerFailure, UserModel>> signUp(UserModel user);
  Future<Either<ServerFailure, bool>> signOut();
}
