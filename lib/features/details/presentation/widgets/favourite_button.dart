import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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