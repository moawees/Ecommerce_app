import 'package:carto/features/home/presentation/widgets/category_listview.dart';
import 'package:carto/features/home/presentation/widgets/home_appbar.dart';
import 'package:carto/features/home/presentation/widgets/product_listview.dart';
import 'package:carto/features/home/presentation/widgets/recently_item_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeAppbar(),
          SizedBox(
            height: 10.h,
          ),
          Image.asset(
            'assets/images/home.png',
          ),
          SizedBox(
            height: 8.h,
          ),
          CategoryListView(),
          SizedBox(
            height: 30.h,
          ),
          Row(
            children: [
              Text(
                'Hot Sales',
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Spacer(),
              Text(
                'See All',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          ProductListView(),
          SizedBox(
            height: 15.h,
          ),
          Text(
            "Recently Viewed",
            style: TextStyle(
              fontSize: 20.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          RecentlyItemListView(),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    ))));
  }
}
