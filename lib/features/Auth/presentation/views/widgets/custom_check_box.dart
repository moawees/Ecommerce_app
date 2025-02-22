import 'package:carto/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked=false;
  @override
  Widget build(BuildContext context) {
    return  Checkbox(
      activeColor: ColorsManager.primaryColor,
      value: isChecked, 
      onChanged:(value){
        setState(() {
          isChecked=value!;
          
        });
      }
      
      );
  }
}