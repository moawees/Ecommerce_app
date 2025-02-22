import 'package:carto/features/Auth/presentation/views/widgets/custom_text_field.dart';
import 'package:carto/features/Auth/presentation/views/widgets/have_account_or_no_button.dart';
import 'package:carto/features/Auth/presentation/views/widgets/login_with_another_way.dart';
import 'package:carto/features/Auth/presentation/views/widgets/or_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carto/core/router/routes.dart';
import 'package:carto/core/widgets/custom_buttom.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: 
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: double.infinity,),
            Padding(
              padding:  EdgeInsets.only(top: 50.h, bottom: 10.h,),
              child: SvgPicture.asset(
                height: 70.h,
                width: 70.w, 
                'assets/images/logo.svg'
                 ),
            ),
            Text(
              "Login",
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.w500
            ),),
            SizedBox(height: 50.h,),
            CustomTextField(
              hintText: "Email",
              icon: Icons.email,
              isPassword: false,
            ),
            SizedBox(height: 20.h,),
            CustomTextField(
              hintText: "Password",
              icon: Icons.lock,
              isPassword: true,
            ),
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: (){}, 
                  child: Text(
                    "Forget password ?",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13.sp,
                      color: Colors.black
                    ),)),
              ],
            ),

            SizedBox(height: 15.h,),
            CustomButton(
              textButton: "Login", 
              onPressed: (){
              Navigator.pushNamed(context, Routes.home);
            }),
            SizedBox(height: 20.h,),
            OrDivider(),
            SizedBox(height: 20.h,),
            LoginWithAnotherWay(),
            SizedBox(height: 40.h,),    
            HaveAccountOrNoButton(
            text1: "Don't have an account?", 
            text2: " Sgin UP", 
            onTap: (){})

          ],
        ),
      )),
    );
  }
}








