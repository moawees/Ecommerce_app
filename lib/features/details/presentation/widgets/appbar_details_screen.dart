import 'package:carto/features/details/presentation/widgets/favourite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarDetailsScreen extends StatelessWidget {
  const AppBarDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
         
          IconButton(
           onPressed: () => Navigator.pop(context),
           icon:CircleAvatar(
            backgroundColor: Colors.white,
            radius: 17.r,
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 17.r,
              color: Colors.grey,),
            )),
          
          Spacer(),
          FavouriteButton(),
        ],
      ),
    );
  }
}