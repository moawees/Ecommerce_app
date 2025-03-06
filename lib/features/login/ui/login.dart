import 'package:carto/core/theme/colors.dart';
import 'package:carto/features/login/cubit/login_cubit.dart';
import 'package:carto/features/login/ui/widgets/custom_text_field.dart';
import 'package:carto/features/login/ui/widgets/have_account_or_no_button.dart';
import 'package:carto/features/login/ui/widgets/login_with_another_way.dart';
import 'package:carto/features/login/ui/widgets/or_divider.dart';
import 'package:carto/features/login/ui/widgets/showlogo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carto/core/router/routes.dart';
import 'package:carto/core/widgets/custom_buttom.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Login Success"),
            ),
          );
        }
        if (state is LoginFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error.errMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
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
                  "Login",
                  style:
                      TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Form(
                    key: context.read<LoginCubit>().signInFormKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.w),
                      child: Column(
                        children: [
                          CustomTextField(
                            controller:
                                context.read<LoginCubit>().emailController,
                            hintText: "Email",
                            icon: Icons.email,
                            isPassword: false,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          CustomTextField(
                            controller:
                                context.read<LoginCubit>().passwordController,
                            hintText: "Password",
                            icon: Icons.lock,
                            isPassword: true,
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forget password ?",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp,
                              color: Colors.black),
                        )),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                state is LoginLoading
                    ? CircularProgressIndicator(
                        color: ColorsManager.primaryColor,
                      )
                    : CustomButton(
                        textButton: "Login",
                        onPressed: () {
                          if (context
                              .read<LoginCubit>()
                              .signInFormKey
                              .currentState!
                              .validate()) {
                            context.read<LoginCubit>().emitLoginState();
                          }
                        }),
                SizedBox(
                  height: 20.h,
                ),
                OrDivider(),
                SizedBox(
                  height: 20.h,
                ),
                LoginWithAnotherWay(),
                SizedBox(
                  height: 40.h,
                ),
                HaveAccountOrNoButton(
                    text1: "Don't have an account?",
                    text2: " Sgin UP",
                    onTap: () {
                      Navigator.pushNamed(context, Routes.signup);
                    }),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          )),
        );
      },
    );
  }
}
