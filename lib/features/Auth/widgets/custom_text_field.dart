import 'package:carto/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
  });

  final String hintText;
  final IconData icon;
  final bool isPassword;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      width: 290.w,
      height: 43.h,
      child: Center(
        child: TextField(
          obscureText: widget.isPassword ? _isObscure : false,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle:
                TextStyle(color: Colors.grey, fontSize: 14.sp, height: 2.h),
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: EdgeInsets.all(3.r),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: ColorsManager.primaryColor.withOpacity(.2)),
                  child: Icon(widget.icon, color: ColorsManager.primaryColor)),
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
