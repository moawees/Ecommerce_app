import 'package:carto/features/home/ui/widgets/drawer_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomDrawer extends StatelessWidget {
  final VoidCallback onClose;
   const CustomDrawer({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.all(10.r),
              child: Row(
                
                children: [
                   CircleAvatar(
                    radius: 35.r,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                   Padding(
                    padding: EdgeInsets.only(left: 10.w, top: 15.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mohamed Ahmed ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "flutter Devolper",
                          style: TextStyle(
                            color: Color.fromARGB(255, 104, 102, 102),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.8,
                          ),
                        )
                      ],
                    ),
                  ),
                   Spacer(),
                  IconButton(
                      onPressed: onClose,
                      icon:  Icon(Icons.arrow_forward_ios))
                ],
              ),
            ),
             SizedBox(
              height: 30.h,),
            CustomDrawerButton(
              onTap: () {},
              text: "My favourites",
              icon: Icons.favorite,
            ),
            SizedBox(
              height: 10.h,),
            CustomDrawerButton(
              onTap: () {},
              text: "Wallets",
              icon: Icons.wallet,
            ),
            SizedBox(
              height: 10.h,),
            CustomDrawerButton(
              onTap: () {},
              text: "My orders",
              icon: Icons.shopping_bag_outlined,
            ),
            SizedBox(
              height: 10.h,),
            CustomDrawerButton(
              onTap: () {},
              text: "About us",
              icon: Icons.assignment,
            ),
            SizedBox(
              height: 10.h,),
            CustomDrawerButton(
              onTap: () {},
              text: "Privacy policy",
              icon: Icons.lock,
            ),
            SizedBox(
              height: 10.h,),
            CustomDrawerButton(
              onTap: () {},
              text: "Settings",
              icon: Icons.settings,
            ),
             SizedBox(
              height: 60.h,
            ),
            CustomDrawerButton(
              onTap: () {},
              text: "Log out",
              icon: Icons.logout,
            ),
             Spacer(),
            Padding(
              padding:  EdgeInsets.all(30),
              child: SvgPicture.asset(
                'assets/images/logo.svg',
                width: 75.w,
                height: 75.h,
              ),
            )
          ],
        ));
  }
}
