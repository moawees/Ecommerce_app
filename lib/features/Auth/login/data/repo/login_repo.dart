// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carto/core/networking/dio_consumer.dart';
import 'package:carto/core/networking/end_points.dart';
import 'package:carto/features/Auth/login/data/models/login_request_body_model.dart';
import 'package:carto/features/Auth/login/data/models/login_respons_model.dart';

class LoginRepo {
  final DioConsumer _dioConsumer;
  LoginRepo(
    this._dioConsumer,
  );

  Future<LoginResponsModel> login(String email, String password) async {
    LoginResponsModel respons = await _dioConsumer.post(
        EndPoints.login,
        data: LoginRequestBodyModel(
          email: email, 
          password: password
          ));

    return respons;
  }
}
