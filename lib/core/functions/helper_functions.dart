import 'package:flutter/material.dart';

int getMaxLines(BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;

  if (screenHeight < 650) {
    return 1; // Small screens
  } else if (screenHeight < 900) {
    return 3; // Medium screens
  } else {
    return 5; // Large screens
  }
}
