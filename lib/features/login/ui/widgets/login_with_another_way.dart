import 'package:carto/core/widgets/coming_soon_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginWithAnotherWay extends StatelessWidget {
  const LoginWithAnotherWay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            showComingSoonDialog(context);
          },
          child: CircleAvatar(
            radius: 28.r,
            backgroundColor: Colors.white,
            child: SvgPicture.asset(
                height: 25.h, width: 25.w, 'assets/images/Facebook.svg'),
          ),
        ),
        SizedBox(
          width: 25.w,
        ),
        GestureDetector(
          onTap: () {
            showComingSoonDialog(context);
          },
          child: CircleAvatar(
            radius: 28.r,
            backgroundColor: Colors.white,
            child: SvgPicture.asset(
                height: 25.h, width: 25.w, 'assets/images/google.svg'),
          ),
        ),
      ],
    );
  }
}
