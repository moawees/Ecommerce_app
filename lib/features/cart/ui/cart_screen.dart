import 'package:carto/core/theme/colors.dart';
import 'package:carto/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true, // Ensures the title is centered
        title: Text(
          "My Cart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.sp,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                ),
                CartItem(),
                CartItem(),
             
                Spacer(),
                Divider(),
                Row(
                  children: [
                    Text("Subtotal:",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w400),),
                    Spacer(),
                    Text("100",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),)
                  ],
                ),
                SizedBox(height: 20.h,),
            
                CustomButton(textButton: "Checkout", onPressed: (){})
              ],
            ),
          )),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

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
          SizedBox(
            height: double.infinity,
          ),
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
              Text(
                "Product Test",
                style: TextStyle(fontSize: 16.sp, color: Colors.grey),
              ),
              Text(
                "\$299",
                style: TextStyle(
                    fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Spacer(),
          QuantityProductButton(
            icon: Icons.add,
          ),
          Text("100"),
          QuantityProductButton(icon: Icons.remove)
        ],
      ),
    );
  }
}

class QuantityProductButton extends StatelessWidget {
  final IconData icon;
  const QuantityProductButton({
    super.key, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: CircleAvatar(
          backgroundColor: ColorsManager.primaryColor,
            child: Icon(
          icon,
          color: Colors.white,
        )));
  }
}
