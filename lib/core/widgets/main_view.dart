import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:carto/core/theme/colors.dart';
import 'package:carto/features/home/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final NotchBottomBarController _controller = NotchBottomBarController();
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    Center(child: Text("Search", style: TextStyle(fontSize: 24))),
    Center(child: Text("favourite", style: TextStyle(fontSize: 24))),
    Center(child: Text("Profile", style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        color: ColorsManager.backgroundColor,
        
        showLabel: true,
        notchColor: ColorsManager.primaryColor,
        kIconSize: 20.r,
        kBottomRadius: 15.r,
        bottomBarItems: [
          _buildBottomBarItem(Icons.home, "Home"),
          _buildBottomBarItem(Icons.shopping_cart_outlined, "Cart"),
          _buildBottomBarItem(Icons.favorite, "Favorite"),
          _buildBottomBarItem(Icons.person, "Profile"),
          

        ],
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }

  BottomBarItem _buildBottomBarItem(IconData icon, String label) {
    return BottomBarItem(
      inActiveItem: Icon(icon, color: Colors.grey),
      activeItem: Icon(icon, color: Colors.white),
      itemLabel: label,
    );
  }
}
