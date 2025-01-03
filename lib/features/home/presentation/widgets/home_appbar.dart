import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        height: 40.h,
        width: 250.w,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(25.r)),
        child: TextField(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            size: 20.r,
            color: Colors.grey,
          ),
          hintText: 'Search Products...',
          hintStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
        )),
      ),
      Spacer(),
      CircleAvatar(
        radius: 23.r,
        backgroundColor: Colors.grey.shade200,
        child: Icon(
          Icons.notifications_none_outlined,
          color: Colors.grey,
          size: 22.r,
        ),
      )
    ]);
  }
}
