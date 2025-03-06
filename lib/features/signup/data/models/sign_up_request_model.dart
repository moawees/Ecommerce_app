class SignUpRequestModel {
  String? name;
  String? email;
  String? password;
  String? passwordConfirm;

  SignUpRequestModel({
    this.name,
    this.email,
    this.password,
    this.passwordConfirm,
  });

  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) {
    return SignUpRequestModel(
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      passwordConfirm: json['passwordConfirm'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'passwordConfirm': passwordConfirm,
      };
}
