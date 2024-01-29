class UserModel {
  int? id;
  String name;
  String email;
  String? password;
  String? token;
  String? tokenType;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    this.password,
    this.token,
    this.tokenType,
  });

  factory UserModel.fromJson(Map json) => UserModel(
        id: json["user"]["id"],
        name: json["user"]["name"],
        email: json["user"]["email"],
        token: json["access_token"],
        tokenType: json["token_type"],
      );

  Map<String, dynamic> userModelToJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
