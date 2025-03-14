import 'package:carto/features/home/cubit/fetch_products_cubit.dart';
import 'package:carto/features/home/ui/widgets/product_view.dart';
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
        if (state is FetchProductsSuccess) {
          return SizedBox(
            height: 158.h,
            child: ListView.builder(
              itemCount: state.products.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ProductView(
                  image: state.products[index].imageCover,
                  title: state.products[index].title,
                  price: state.products[index].price,
                );
              },
            ),
          );
        } else if (state is FetchProductsFailure) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
