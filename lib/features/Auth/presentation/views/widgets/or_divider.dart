import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
     mainAxisSize: MainAxisSize.min,
         children: [
           SizedBox(
             width: 110.w,
             child: Divider(
               color: Colors.grey.shade400,
               thickness: 2,
             ),
           ),
           Text(
             " Or ",
             style: TextStyle(
               fontSize: 13.sp,
               color: Colors.grey,
             ),
           ),
           SizedBox(
             width: 110.w,
             child: Divider(
               color: Colors.grey.shade400,
               thickness: 2,
             ),
           ),
         ],
       );
  }
}