import 'package:carto/core/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductView extends StatelessWidget {
  const ProductView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(Routes.details);
      },
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
              Container(
                width: 140.w,
                height: 98.h,
                decoration: BoxDecoration(
                  //color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                ),
                child: Image.asset(
                  'assets/images/product1.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
                child: Text(
                  'Sony WH/1000M577777777777777777777777777777',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
              Center(
                child: Text(
                  '\$ 4,999',
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ],
          )),
    );
  }
}
