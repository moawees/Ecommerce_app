import 'package:carto/features/home/presentation/widgets/recently_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentlyItemListView extends StatelessWidget {
  const RecentlyItemListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: ListView.builder(
          itemCount: 5,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return RecentlyViewItem();
          }),
    );
  }
}
