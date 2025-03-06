import 'package:carto/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showErrorDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: ColorsManager.backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), // Rounded corners
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 70.r,
          ),
           SizedBox(height: 5.h), // Spacing
          Text(
            "Error",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
          ),
           SizedBox(height: 8.h), // Spacing
          Text(
            message,
            textAlign: TextAlign.center,
            style:  TextStyle(fontSize: 16.sp),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            "OK", 
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold),),
        ),
      ],
    ),
  );
}
