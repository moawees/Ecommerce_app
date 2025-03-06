import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ShowLogo extends StatelessWidget {
  const ShowLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 30.h,
        bottom: 10.h,
      ),
      child:
          SvgPicture.asset(height: 70.h, width: 70.w, 'assets/images/logo.svg'),
    );
  }
}
