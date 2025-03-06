import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HaveAccountOrNoButton extends StatelessWidget {
  final String text1;
  final String text2;
  final VoidCallback onTap;

  const HaveAccountOrNoButton({
    super.key,
    required this.text1,
    required this.text2,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: text1,
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.grey),
            children: [
          TextSpan(
            text: text2,
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          )
        ]));
  }
}
