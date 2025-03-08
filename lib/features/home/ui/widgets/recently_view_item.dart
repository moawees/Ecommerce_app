import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentlyViewItem extends StatelessWidget {
  const RecentlyViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(children: [
        Container(
            margin: EdgeInsets.only(right: 10.w),
            width: 200.w,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 245, 245, 215).withOpacity(0.7),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/product.png',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
                  child: Text(
                    'Sony WH/1000M5',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      '\$ 4,999',
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            )),
        Positioned(
          left: 184,
          top: 5,
          child: CircleAvatar(
            radius: 13.r,
            backgroundColor: Colors.white.withOpacity(0.7),
            child: Icon(
              Icons.favorite_border_outlined,
              color: Colors.red,
              size: 22.r,
            ),
          ),
        ),
      ]),
    );
  }
}
