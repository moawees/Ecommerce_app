import 'package:carto/core/theme/colors.dart';
import 'package:carto/core/widgets/custom_buttom.dart';
import 'package:carto/features/cart/cubit/fetch_cart_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchCartCubit, FetchCartCubitState>(
      listener: (context, state) {
        // Handle any side effects if needed
      },
      builder: (context, state) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: _buildBody(state),
            ),
          ),
        );
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        "My Cart",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25.sp,
        ),
      ),
      // leading: IconButton(
      //   onPressed: () {},
      //   icon: Icon(Icons.arrow_back_ios),
      // ),
    );
  }

  Widget _buildBody(FetchCartCubitState state) {
    if (state is FetchCartCubitLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (state is FetchCartCubitFailure) {
      return Center(child: Text(state.message));
    } else if (state is FetchCartCubitEmpty) {
      return Center(child: Text("Your cart is empty"));
    } else if (state is FetchCartCubitSuccess) {
      return _buildCartContent(state);
    }
    return Container();
  }

  Widget _buildCartContent(FetchCartCubitSuccess state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: state.cart.cartItems.length,
            itemBuilder: (context, index) => CartItem(
              imageUrl: state.cart.cartItems[index].productId,
              productName:  state.cart.cartItems[index].productId,
              price: state.cart.cartItems[index].price,
              quantity: state.cart.cartItems[index].quantity,
            ),
          ),
        ),
        Divider(),
        _buildSubtotalRow(state),
        SizedBox(height: 20.h),
        CustomButton(textButton: "Checkout", onPressed: () {})
      ],
    );
  }

  Widget _buildSubtotalRow(FetchCartCubitSuccess state) {
    return Row(
      children: [
        Text(
          "Total:",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
        ),
        Spacer(),
        Text(
          state.cart.totalCartPrice.toString(),
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class CartItem extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final double price;
  final int quantity;
  const CartItem(
      {super.key,
      required this.imageUrl,
      required this.productName,
      required this.price,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 333.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(8),
            width: 84.w,
            height: 73.h,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Image.asset("assets/images/product.png"),
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 85.w,
                child: Text(
                  productName,
                  style: TextStyle(
                    fontSize: 16.sp, 
                    color: Colors.grey,
                    overflow: TextOverflow.ellipsis,),
                ),
              ),
              Text(
                price.toString(),
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Spacer(),
          QuantityProductButton(icon: Icons.add),
          Text(quantity.toString()),
          QuantityProductButton(icon: Icons.remove)
        ],
      ),
    );
  }
}

class QuantityProductButton extends StatelessWidget {
  final IconData icon;
  const QuantityProductButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: CircleAvatar(
        backgroundColor: ColorsManager.primaryColor,
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
