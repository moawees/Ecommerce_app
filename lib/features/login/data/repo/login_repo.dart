// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carto/core/cache/cache_helper.dart';
import 'package:carto/core/errors/erorr_handler.dart';
import 'package:carto/core/networking/api_consumer.dart';
import 'package:carto/core/networking/end_points.dart';
import 'package:carto/features/login/data/models/login_request_body_model.dart';
import 'package:carto/features/login/data/models/login_respons_model.dart';
import 'package:dartz/dartz.dart';

class LoginRepo {
  final ApiConsumer api;
  LoginRepo({
    required this.api,
  });

  Future<Either<LoginResponsModel, Failure>> login(
      {required String email, required String password}) async {
    try {
      final response = await api.post(
        EndPoints.login,
        data: LoginRequestBodyModel(email: email, password: password).toJson(),
      );
      final user = LoginResponsModel.fromJson(response);
      CacheHelper().saveData(key: "token",value: user.token);

      return Left(user);
    } catch (e) {
      return Right(
        ErrorHandler.handle(e),
      );
    }
  }
}
