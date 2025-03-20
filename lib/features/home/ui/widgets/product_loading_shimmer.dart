import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductLoadingShimmer extends StatelessWidget {
  const ProductLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: EdgeInsets.only(right: 10.w),
        width: 150.w,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image placeholder
            Container(
              width: 140.w,
              height: 98.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
            ),
            // Title placeholder with shimmer effect
            Padding(
              padding: EdgeInsets.only(left: 8.w, top: 8.h),
              child: Container(
                height: 14.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
            ),
            SizedBox(height: 5.h),
            // Price placeholder with shimmer effect
            Center(
              child: Container(
                height: 14.h,
                width: 60.w,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
