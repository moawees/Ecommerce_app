import 'package:carto/features/home/ui/widgets/product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 158.h,
      child: ListView.builder(
          itemCount: 5,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ProductView();
          }),
    );
  }
}
