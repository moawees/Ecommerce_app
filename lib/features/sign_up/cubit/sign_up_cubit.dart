import 'package:bloc/bloc.dart';
import 'package:carto/core/errors/erorr_handler.dart';
import 'package:carto/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:flutter/material.dart';


part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo signUpRepo;
  SignUpCubit(this.signUpRepo) : super(SignUpInitial());
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void emitSignUpState() async {
    emit(SignUpLoading());
    final result = await signUpRepo.signUp(
      name: nameController.text, 
      email: emailController.text, 
      password: passwordController.text, 
      passwordConfirm: confirmPasswordController.text
    );
    
    result.fold((data) {
      emit(SignUpSuccess());
      print(data);
    }, (error) {
      emit(SignUpFailed(error));
    });
  }

}
