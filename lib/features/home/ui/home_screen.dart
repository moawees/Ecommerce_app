import 'package:carto/core/networking/dio_consumer.dart';
import 'package:carto/features/home/cubit/fetch_products_cubit.dart';
import 'package:carto/features/home/data/repo/home_repo.dart';
import 'package:carto/features/home/ui/widgets/category_listview.dart';
import 'package:carto/features/home/ui/widgets/home_appbar.dart';
import 'package:carto/features/home/ui/widgets/product_listview.dart';
import 'package:carto/features/home/cubit/drawer_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerCubit, bool>(
      builder: (context, isDrawerOpen) {
        return Scaffold(
          // backgroundColor:
          //     isDrawerOpen ? Colors.white : ColorsManager.backgroundColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeAppbar(
                      onTap: () => context.read<DrawerCubit>().openDrawer(),
                    ),
                    SizedBox(height: 10.h),
                    Image.asset('assets/images/home.png'),
                    SizedBox(height: 8.h),
                    CategoryListView(),
                    SizedBox(height: 35.h),
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
                    SizedBox(height: 17.h),
                    BlocProvider(
                      create: (context) => FetchProductsCubit(
                          HomeRepo(api: DioConsumer(dio: Dio())))
                        ..fetchProducts(),
                      child: ProductListView(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
