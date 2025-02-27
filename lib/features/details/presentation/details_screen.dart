import 'package:carto/core/functions/helper_functions.dart';
import 'package:carto/core/widgets/custom_buttom.dart';
import 'package:carto/features/details/presentation/widgets/appbar_details_screen.dart';
import 'package:carto/features/details/presentation/widgets/color_selector.dart';
import 'package:carto/features/details/presentation/widgets/imageSelector_With_PageView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarDetailsScreen(),
            ImageSelectorWithPageView(),
            SizedBox(height: 10.h),
            Expanded(
              // This ensures the container expands to the bottom
              child: Container(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 35.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45.r),
                    topRight: Radius.circular(45.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Curved Hem Shirts",
                            style: TextStyle(fontSize: 19.sp)),
                        Spacer(),
                        Text("\$100", style: TextStyle(fontSize: 19.sp)),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      maxLines: getMaxLines(context),
                      overflow: TextOverflow.ellipsis,
                      "This is a description of the product...This is a description of the product...This is a description of the product...This is a description of the product...This is a description of the product...This is a description of the product...This is a description of the product...This is a description of the product...",
                      style: TextStyle(
                        fontSize: 14.sp,
                        height: 1.3.h,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text("Colors", style: TextStyle(fontSize: 18.sp)),
                    SizedBox(height: 10.h),
                    const ColorSelector(),
                    Spacer(), // Pushes the button to the bottom
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: Center(
                        child: CustomButton(
                            textButton: "Add to Cart", onPressed: () {}),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
