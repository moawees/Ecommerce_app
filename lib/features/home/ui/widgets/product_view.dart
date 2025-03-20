import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductView extends StatelessWidget {
  final String image;
  final String title;
  final double price;
  
  const ProductView({
    super.key,
    required this.image,
    required this.title,
    required this.price, 
    
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: image,
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
              child: Text(
                title,
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
                '\$ ${price}',
                maxLines: 1,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
          ],
        ));
  }
}
