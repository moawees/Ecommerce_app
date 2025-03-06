import 'package:carto/core/router/routes.dart';
import 'package:carto/core/widgets/custom_buttom.dart';
import 'package:carto/features/login/ui/widgets/custom_text_field.dart';
import 'package:carto/features/login/ui/widgets/have_account_or_no_button.dart';
import 'package:carto/features/login/ui/widgets/login_with_another_way.dart';
import 'package:carto/features/login/ui/widgets/or_divider.dart';
import 'package:carto/features/login/ui/widgets/showlogo.dart';
import 'package:carto/features/login/ui/widgets/terms_and_conidition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
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
              "Sign up",
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 25.h,
            ),
            // CustomTextField(
            //   controller: ,
            //   hintText: "Name",
            //   icon: Icons.person,
            //   isPassword: false,
            // ),
            SizedBox(
              height: 13.h,
            ),
            // CustomTextField(
            //   hintText: "Email",
            //   icon: Icons.email,
            //   isPassword: false,
            // ),
            SizedBox(
              height: 13.h,
            ),
            // CustomTextField(
            //   hintText: "Password",
            //   icon: Icons.lock,
            //   isPassword: true,
            // ),
            SizedBox(
              height: 13.h,
            ),
            // CustomTextField(
            //   hintText: "Confirm Password",
            //   icon: Icons.lock,
            //   isPassword: true,
            // ),
            SizedBox(
              height: 5.h,
            ),
            TermsAndConidition(),
            SizedBox(
              height: 10.h,
            ),
            CustomButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.home);
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
      )),
    );
  }
}
