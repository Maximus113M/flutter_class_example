import 'package:dio/dio.dart';
import 'package:flutter_class_example/core/errors/exceptions.dart';
import 'package:flutter_class_example/core/services/auth_service.dart';

import 'package:flutter_class_example/features/sign_in/data/models/sign_in_model.dart';
import 'package:flutter_class_example/features/sign_in/data/models/user_model.dart';

abstract class SignInDataSource {
  Future<UserModel?> logIn(SignInDataModel signInData);
  Future<UserModel?> signUp(UserModel user);
  Future<bool> signOut();
}

class ReasonDataSourceImpl extends SignInDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.201.194.60:8000/api/auth',
    ),
  );

  @override
  Future<UserModel?> logIn(SignInDataModel signInData) async {
    try {
      final response = await dio.post('login', data: signInData.signInDataToJson());

      if (response.statusCode == 200 || response.statusCode == 201) {
        UserModel user = UserModel.fromJson(response.data!);
        AuthService.user= user;
        print(user);

        return user;
      }
      return null;
    } catch (e) {
      print(e);
      throw ServerException(
          message: 'Ha ocurrido una error al iniciar Sesion',
          type: ExceptionType.signinException);
    }
  }

  @override
  Future<UserModel?> signUp(UserModel user) async {
    try {
      final Response response =
          await dio.post('login', data: user.userModelToJson());

      if (response.statusCode == 200 || response.statusCode == 201) {
        return null;
      }
      return null;
    } on DioException catch (e) {
      print(e.error);
      throw ServerException(
          message: 'Ha ocurrido una error al intentar crear el motivo',
          type: ExceptionType.reasonsException);
    }
  }
  
  @override
  Future<bool> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  
}
