import 'package:carto/core/errors/erorr_handler.dart';
import 'package:carto/core/networking/api_consumer.dart';
import 'package:carto/core/networking/end_points.dart';
import 'package:carto/features/sign_up/data/models/sign_up_request_model.dart';
import 'package:carto/features/sign_up/data/models/sign_up_response_model.dart';
import 'package:dartz/dartz.dart';

class SignUpRepo {
  final ApiConsumer api;

  SignUpRepo({required this.api});

  Future<Either<SignUpResponseModel, Failure>> signUp({
    required String name,
    required String email,
    required String password,
    required String passwordConfirm,
  }) async {
    try {
      final response = await api.post(
        EndPoints.signUp,
        data: SignUpRequestModel(
          name: name,
          email: email,
          password: password,
          passwordConfirm: passwordConfirm,
        ).toJson(),
      );

      final user = SignUpResponseModel.fromJson(response);
      return Left(user);
    } catch (e) {
      return Right(
        ErrorHandler.handle(e),
      );
    }
  }
}
