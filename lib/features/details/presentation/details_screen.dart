import 'package:carto/core/functions/helper_functions.dart';
import 'package:carto/core/networking/dio_consumer.dart';
import 'package:carto/core/widgets/custom_buttom.dart';
import 'package:carto/features/cart/data/model/cart_request_model.dart';
import 'package:carto/features/cart/data/repo/cart_repo.dart';
import 'package:carto/features/details/presentation/widgets/appbar_details_screen.dart';
import 'package:carto/features/details/presentation/widgets/color_selector.dart';
import 'package:carto/features/details/presentation/widgets/imageSelector_With_PageView.dart';
import 'package:carto/features/home/data/models/products_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarDetailsScreen(),
            ImageSelectorWithPageView(
             
            ),
            SizedBox(height: 10.h),
            Expanded(
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
                        Expanded(
                          child: Text(
                            product.title,
                            style: TextStyle(fontSize: 19.sp),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis, 
                          ),
                        ),
                        SizedBox(width: 20.w), 
                        Text(
                          '\$ ${product.price}',
                          style: TextStyle(fontSize: 19.sp),
                        ),
                      ],
                    ),

                    SizedBox(height: 8.h),
                    Text(
                      maxLines: getMaxLines(context),
                      overflow: TextOverflow.ellipsis,
                      product.description,
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
                            textButton: "Add to Cart", onPressed: () {
                              CartRepo(
                                api: DioConsumer(dio:Dio()),
                              ).addProductToCart(productId: product.id);
                              
                            }),
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
