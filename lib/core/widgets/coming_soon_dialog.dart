import 'package:carto/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showComingSoonDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: ColorsManager.backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), 
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           Icon(
            Icons.hourglass_empty,
            color: ColorsManager.primaryColor,
            size: 70.r,
          ),
           SizedBox(height: 16.h), 
           Text(
            "Coming Soon!",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ColorsManager.primaryColor),
          ),
           SizedBox(height: 8.h), 
           Text(
            "This feature is not available yet. Stay tuned!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.sp),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child:  Text(
            "OK", 
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold)),
        ),
      ],
    ),
  );
}