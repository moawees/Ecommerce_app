import 'package:carto/features/home/ui/widgets/category_listview.dart';
import 'package:carto/features/home/ui/widgets/home_appbar.dart';
import 'package:carto/features/home/ui/widgets/product_listview.dart';
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
      padding:  EdgeInsets.only(left: 8.w, right: 8.w, ),
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
            height: 35.h,
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
            height: 17.h,
          ),
          ProductListView(),
   
        ],
      ),
    ))));
  }
}
