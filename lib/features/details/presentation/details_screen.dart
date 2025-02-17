import 'package:carto/core/theme/colors.dart';
import 'package:carto/core/widgets/custom_buttom.dart';
import 'package:carto/features/details/presentation/widgets/color_selector.dart';
import 'package:carto/features/details/presentation/widgets/imageSelector_With_PageView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              AppBarDetailsScreen(),
              ImageSelectorWithPageView(),
              SizedBox(
                height: 10.h,
              ),
            
              Container(
                //height: MediaQuery.of(context).size.height * 0.60,
                  //margin: EdgeInsets.only(left: 0.w,right: 0.w,top: 10.h),
                  padding: 
                   EdgeInsets.only(left: 20.w, right: 20.w, top: 35.h),
                  width: double.infinity,
                  decoration:  BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45.r),
                        topRight: Radius.circular(45.r)),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Row(
                          children: [
                            Text("Curved Hem Shirts",
                                style: TextStyle(fontSize: 19.sp)),
                            Spacer(),
                            Text("\$100",
                                style: TextStyle(fontSize: 19.sp))
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                            "this is a description of the product, this is a description of the product, this is a description of the product,this is a description of the product this is a description of the productthis is a description of the product",
                            style: TextStyle(
                              fontSize: 14.sp,
                              height: 1.3.h,
                            )),
                        SizedBox(
                          height: 13.h,
                        ),
                        Text(
                          "Colors",
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const ColorSelector(),
                        SizedBox(
                          height: 40.h,
                        ),
                        Center(
                          child: CustomButton(textButton: "Add to Cart", onPressed: (){}),
                        ),
                        
                        
                      ])),
                     
                      
            ],
          ),
        ),
      ),
    );
  }
}



class ImageSelector extends StatelessWidget {
  final String image;
  final bool isSelected;
  final VoidCallback onTap;
  const ImageSelector({
    super.key, required this.isSelected, required this.onTap, required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 10),
        padding: EdgeInsets.all(5.r),
        width: 45.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color:isSelected? ColorsManager.primaryColor:Colors.transparent, width: 1.w),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
            
          ),
          
        ),
        child: Image.asset(
          image,),
      
      ),
    );
  }
}

class AppBarDetailsScreen extends StatelessWidget {
  const AppBarDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
         
          IconButton(
           onPressed: () => Navigator.pop(context),
           icon:CircleAvatar(
            backgroundColor: Colors.white,
            radius: 17.r,
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 17.r,
              color: Colors.grey,),
            )),
          
          Spacer(),
          FavouriteButton(),
        ],
      ),
    );
  }
}

class FavouriteButton extends StatefulWidget {
  const FavouriteButton({super.key});

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 17.r,
      child: IconButton(
        highlightColor: Colors.transparent,
        onPressed: () {
          setState(() {
            isFavourite = !isFavourite;
          });
        },
        icon: Icon(
          size: 17.r,
          isFavourite ? Icons.favorite : Icons.favorite_border,
          color: isFavourite ? Colors.red : Colors.grey,
        ),
      ),
    );
  }
}