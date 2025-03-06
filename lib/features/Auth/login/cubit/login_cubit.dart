import 'package:bloc/bloc.dart';
import 'package:carto/core/errors/erorr_handler.dart';
import 'package:carto/features/Auth/login/data/repo/login_repo.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this.loginRepo,
  ) : super(LoginInitial());
  final LoginRepo loginRepo;
 
  GlobalKey<FormState> signInFormKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void emitLoginState() async {
    emit(LoginLoading());
    final result = await loginRepo.login(
      email: emailController.text,
      password: passwordController.text,
    );

    result.fold((data) {
      emit(LoginSuccess());
      print(data);
    }, (error) {
      emit(LoginFailed(error));
    });
  }
}
