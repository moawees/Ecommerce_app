import 'package:carto/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageSelector extends StatelessWidget {
  final String image;
  final bool isSelected;
  final VoidCallback onTap;
  const ImageSelector({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.image,
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
          border: Border.all(
              color:
                  isSelected ? ColorsManager.primaryColor : Colors.transparent,
              width: 1.w),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Image.asset(
          image,
        ),
      ),
    );
  }
}
