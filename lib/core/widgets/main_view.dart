import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:carto/core/networking/dio_consumer.dart';
import 'package:carto/core/theme/colors.dart';
import 'package:carto/features/cart/cubit/fetch_cart_cubit_cubit.dart';
import 'package:carto/features/cart/data/repo/cart_repo.dart';
import 'package:carto/features/cart/ui/cart_screen.dart';
import 'package:carto/features/home/cubit/drawer_cubit.dart';
import 'package:carto/features/home/ui/home_screen.dart';
import 'package:carto/features/home/ui/widgets/custom_drawer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final NotchBottomBarController _controller = NotchBottomBarController();
  int _selectedIndex = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final List<Widget> _pages = [
    const HomeScreen(),
    BlocProvider(
      create: (context) => FetchCartCubit(
        CartRepo(api: DioConsumer(dio: Dio())),
      )..fetchCart(),
      child: const CartScreen(),
    ),
    const Center(child: Text("Favourite", style: TextStyle(fontSize: 24))),
    const Center(child: Text("Profile", style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerCubit, bool>(
      builder: (context, isDrawerOpen) {
        double xOffset = isDrawerOpen ? 230 : 0;
        double yOffset = isDrawerOpen ? 130 : 0;
        double scaleFactor = isDrawerOpen ? 0.7 : 1;

        return Scaffold(
          bottomNavigationBar: Visibility(
            visible: !isDrawerOpen,
            maintainState: true,
            child: AnimatedNotchBottomBar(
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
              onTap: (index) {
                if (!isDrawerOpen) {
                  setState(() => _selectedIndex = index);
                }
              },
            ),
          ),
          body: Stack(
            children: [
              Visibility(
                visible: isDrawerOpen,
                child: CustomDrawer(
                  onClose: () => context.read<DrawerCubit>().closeDrawer(),
                ),
              ),
              AnimatedContainer(
                transform: Matrix4.translationValues(xOffset, yOffset, 0)
                  ..scale(scaleFactor)
                  ..rotateY(isDrawerOpen ? -0.5 : 0),
                decoration: BoxDecoration(
                  borderRadius: isDrawerOpen
                      ? BorderRadius.circular(40)
                      : BorderRadius.zero,
                  boxShadow: isDrawerOpen
                      ? [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 20,
                            spreadRadius: 5,
                          )
                        ]
                      : [],
                ),
                duration: const Duration(milliseconds: 200),
                child: ClipRRect(
                  borderRadius: isDrawerOpen
                      ? BorderRadius.circular(40)
                      : BorderRadius.zero,
                  child: _pages[_selectedIndex],
                ),
              ),
            ],
          ),
        );
      },
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
