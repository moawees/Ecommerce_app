import 'package:carto/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String textButton;
  final IconData? iconButton;
  final void Function()? onPressed;
  const CustomButton({
    super.key, required this.textButton,  this.iconButton, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 208.w,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  ColorsManager.primaryColor)),
          onPressed:onPressed ,
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textButton,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              Visibility(
                visible: iconButton != null? true:false,
                child: Icon(
                  iconButton,
                  
                  color: Colors.white,
                ),
              ),
              
            ],
          )),
    );
  }
}