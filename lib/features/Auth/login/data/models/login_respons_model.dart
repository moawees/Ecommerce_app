import 'data.dart';

class LoginResponsModel {
  Data? data;
  String? token;

  LoginResponsModel({this.data, this.token});

  factory LoginResponsModel.fromJson(Map<String, dynamic> json) {
    return LoginResponsModel(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'token': token,
      };
}

