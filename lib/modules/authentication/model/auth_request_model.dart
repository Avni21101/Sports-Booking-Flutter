class AuthRequestModel {
  AuthRequestModel({required this.email, required this.password, this.name, this.avatar});

  String email;
  String? name;
  String password;
  String? avatar;
}
