import 'package:carto/features/login/data/models/login_respons_model.dart';



class SignUpResponseModel {
  Data? data;
  String? token;

  SignUpResponseModel({this.data, this.token});

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    return SignUpResponseModel(
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
