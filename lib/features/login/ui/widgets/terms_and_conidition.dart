import 'package:carto/features/login/ui/widgets/custom_check_box.dart';
import 'package:carto/features/login/ui/widgets/have_account_or_no_button.dart';
import 'package:flutter/material.dart';

class TermsAndConidition extends StatelessWidget {
  const TermsAndConidition({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomCheckBox(),
        HaveAccountOrNoButton(
            text1: "I accept all the ",
            text2: "Terms & Conditions",
            onTap: () {})
      ],
    );
  }
}
