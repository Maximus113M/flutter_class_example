class SignInDataModel {
  final String email;
  final String password;

  SignInDataModel({required this.email, required this.password});

  Map<String, dynamic> signInDataToJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
