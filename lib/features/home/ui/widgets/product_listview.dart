import 'package:carto/core/router/routes.dart';
import 'package:carto/features/home/cubit/fetch_products_cubit.dart';

import 'package:carto/features/home/ui/widgets/product_view.dart';
import 'package:carto/features/home/ui/widgets/product_loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    final fetchProductsCubit = context.read<FetchProductsCubit>();
    fetchProductsCubit.fetchProducts(); // Trigger API call

    return BlocBuilder<FetchProductsCubit, FetchProductsState>(
      builder: (context, state) {
        return SizedBox(
          height: 158.h,
          child: ListView.builder(
            itemCount: state is FetchProductsSuccess ? state.products.length : 6, // Show 6 shimmer placeholders if loading
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (state is FetchProductsSuccess) {
                 final product = state.products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.details, arguments: product);
                  },
                  child: ProductView(
                    image: state.products[index].imageCover,
                    title: state.products[index].title,
                    price: state.products[index].price,
                    
                    
                  ),
                );
              } else if (state is FetchProductsFailure) {
                return Center(child: Text(state.message));
              } else {
                
                return const ProductLoadingShimmer();
              }
            },
          ),
        );
      },
    );
  }
}
