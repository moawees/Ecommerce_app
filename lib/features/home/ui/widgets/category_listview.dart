import 'package:carto/features/home/ui/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            CategoryItem(
              categoryName: 'Technology',
            ),
            CategoryItem(
              categoryName: 'Fashion',
            ),
            CategoryItem(
              categoryName: 'Sports',
            ),
            CategoryItem(
              categoryName: 'Supermarket',
            ),
            CategoryItem(
              categoryName: 'Women',
            ),
          ]),
    );
  }
}
