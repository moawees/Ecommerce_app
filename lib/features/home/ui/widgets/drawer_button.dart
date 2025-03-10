import 'package:carto/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomDrawerButton extends StatelessWidget {
  IconData icon;
  VoidCallback onTap;
  String text;
  CustomDrawerButton({
    super.key,
    required this.icon,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 35.w,
            height: 35.h,
            margin: EdgeInsets.only(left: 15.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: ColorsManager.primaryColor.withOpacity(0.1),
            ),
            child: Icon(
              icon,
              color: ColorsManager.primaryColor,
              size: 20.r,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(text, style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold
            ) ),
        ],
      ),
    );
  }
}
