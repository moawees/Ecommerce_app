import 'package:carto/core/theme/colors.dart';
import 'package:carto/features/details/presentation/widgets/color_dot.dart';
import 'package:flutter/material.dart';

class ColorSelector extends StatefulWidget {
  const ColorSelector({
    super.key,
  });

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ColorDot(
          color: ColorsManager.primaryColor,
          isSelected: selectedIndex == 0,
          onTap: () {
            setState(() {
              selectedIndex = 0;
            });
          },
        ),
        const SizedBox(
          width: 10,
        ),
        ColorDot(
          color: Colors.black,
          isSelected: selectedIndex == 1,
          onTap: () {
            setState(() {
              selectedIndex = 1;
            });
          },
        ),
        const SizedBox(
          width: 10,
        ),
        ColorDot(
            color: Colors.brown,
            isSelected: selectedIndex == 2,
            onTap: () {
              setState(() {
                selectedIndex = 2;
              });
            }),
        const SizedBox(
          width: 10,
        ),
        ColorDot(
            color: Colors.pink,
            isSelected: selectedIndex == 3,
            onTap: () {
              setState(() {
                selectedIndex = 3;
              });
            }),
      ],
    );
  }
}
