import 'package:carto/features/details/presentation/details_screen.dart';
import 'package:flutter/material.dart';

class ImageSelectorWithPageView extends StatefulWidget {
  const ImageSelectorWithPageView({
    super.key,
  });

  @override
  State<ImageSelectorWithPageView> createState() =>
      _ImageSelectorWithPageViewState();
}

class _ImageSelectorWithPageViewState extends State<ImageSelectorWithPageView> {
  int selectedIndex = 0;
  late PageController _pageController;
  List imgeslist = [
    "assets/images/product.png",
    "assets/images/product1.png",
    "assets/images/product.png",
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.32,
            child: PageView.builder(
              itemCount: imgeslist.length,
              itemBuilder: (context, index) {
                return Image.asset(imgeslist[index]);
              },
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            )),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(imgeslist.length, (index) {
              return ImageSelector(
                isSelected: selectedIndex == index,
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
                image: imgeslist[index],
              );
            }))
      ],
    );
  }
}
