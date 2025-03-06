import 'package:carto/core/router/routes.dart';
import 'package:carto/core/theme/colors.dart';
import 'package:carto/core/widgets/custom_buttom.dart';
import 'package:carto/core/widgets/erorr_dialog.dart';
import 'package:carto/features/login/ui/widgets/custom_text_field.dart';
import 'package:carto/features/login/ui/widgets/have_account_or_no_button.dart';
import 'package:carto/features/login/ui/widgets/login_with_another_way.dart';
import 'package:carto/features/login/ui/widgets/or_divider.dart';
import 'package:carto/features/login/ui/widgets/showlogo.dart';
import 'package:carto/features/login/ui/widgets/terms_and_conidition.dart';
import 'package:carto/features/signup/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Sign up success"),
            ));
          } else if (state is SignUpFailed) {
            showErrorDialog(context, state.error.errMessage);
          }
        },
        builder: (context, state) {
          return SafeArea(
              child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                ),
                ShowLogo(),
                Text(
                  "Sign up",
                  style:
                      TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Form(
                    key: context.read<SignUpCubit>().signUpFormKey,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 23.w),
                      child: Column(
                        children: [
                          CustomTextField(
                            controller:
                                context.read<SignUpCubit>().nameController,
                            hintText: "Name",
                            icon: Icons.person,
                            isPassword: false,
                          ),
                          SizedBox(
                            height: 13.h,
                          ),
                          CustomTextField(
                            hintText: "Email",
                            icon: Icons.email,
                            isPassword: false,
                            controller:
                                context.read<SignUpCubit>().emailController,
                          ),
                          SizedBox(
                            height: 13.h,
                          ),
                          CustomTextField(
                            hintText: "Password",
                            icon: Icons.lock,
                            isPassword: true,
                            controller:
                                context.read<SignUpCubit>().passwordController,
                          ),
                          SizedBox(
                            height: 13.h,
                          ),
                          CustomTextField(
                            hintText: "Confirm Password",
                            icon: Icons.lock,
                            isPassword: true,
                            controller: context
                                .read<SignUpCubit>()
                                .confirmPasswordController,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          TermsAndConidition(),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 10.h,
                ),
                state is SignUpLoading
                    ? CircularProgressIndicator(
                        color: ColorsManager.primaryColor,
                      )
                    : CustomButton(
                        onPressed: () {
                          if (context
                              .read<SignUpCubit>()
                              .signUpFormKey
                              .currentState!
                              .validate()) {
                            context.read<SignUpCubit>().emitSignUpState();
                          }
                        },
                        textButton: "Sign up"),
                SizedBox(
                  height: 15.h,
                ),
                OrDivider(),
                SizedBox(
                  height: 10.h,
                ),
                LoginWithAnotherWay(),
                SizedBox(
                  height: 10.h,
                ),
                HaveAccountOrNoButton(
                    text1: "Already have an account?",
                    text2: "Login",
                    onTap: () {
                      Navigator.pushNamed(context, Routes.login);
                    }),
                SizedBox(
                  height: 10.h,
                )
              ],
            ),
          ));
        },
      ),
    );
  }
}
