// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      // Container(
      //   height: 40.h,
      //   width: 250.w,
      //   decoration: BoxDecoration(
      //       color: Colors.grey.shade200,
      //       borderRadius: BorderRadius.circular(25.r)),
      //   child: TextField(
      //       onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      //       decoration: InputDecoration(
      //         border: InputBorder.none,
      //         prefixIcon: Icon(
      //           Icons.search,
      //           size: 20.r,
      //           color: Colors.grey,
      //         ),
      //         hintText: 'Search Products...',
      //         hintStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
      //       )),
      // ),
      GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          radius: 23.r,
          backgroundColor: Colors.grey.shade200,
          child: Icon(
            Icons.menu,
            color: Colors.grey,
            size: 22.r,
          ),
        ),
      ),
      SizedBox(
        width: 10.w,
      ),

      Spacer(),
      CircleAvatar(
        radius: 23.r,
        backgroundColor: Colors.grey.shade200,
        child: Icon(
          Icons.search,
          color: Colors.grey,
          size: 22.r,
        ),
      ),
      SizedBox(
        width: 10.w,
      ),
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
