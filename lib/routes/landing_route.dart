import 'package:flutfood/commons/constant_data.dart';
import 'package:flutfood/providers/landing_provider.dart';
import 'package:flutfood/widgets/image_svg_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutfood/commons/color_data.dart';
import 'package:flutfood/commons/size_data.dart';
import 'package:flutfood/commons/text_data.dart';
import 'package:flutfood/helpers/bottom_navbar_helper.dart';
import 'package:flutfood/widgets/custom_text_widget.dart';
import 'package:provider/provider.dart';

class LandingRoute extends StatelessWidget {
  final CustomTextWidget _findNerbyMarketText = const CustomTextWidget(
    text: TextData.textFindNearbyResto,
    color: ColorData.grey25,
    fontSize: SizeData.fontSize24,
    maxLines: 2,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<LandingProvider>(
      builder: (context, landingProvider, _) => Scaffold(
        appBar: landingProvider.currentPage == 0
            ? AppBar(
                toolbarHeight: 80.0,
                automaticallyImplyLeading: false,
                centerTitle: false,
                elevation: 0.0,
                backgroundColor: ColorData.white,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: SizeData.padding8,
                        vertical: SizeData.padding8,
                      ),
                      child: _findNerbyMarketText,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, ConstantData.favoriteRestaurantRoute);
                      },
                      child: const ImageSvgWidget(
                        imagePath: 'assets/icons/favorite_icon.svg',
                        height: SizeData.imageHeight30,
                        width: SizeData.imageWidth30,
                        isNeedLoading: false,
                      ),
                    ),
                  ],
                ),
              )
            : AppBar(
                toolbarHeight: 0.0,
                elevation: 0.0,
              ),
        body: bottomNavbarRoute()[landingProvider.currentPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: landingProvider.currentPage,
          backgroundColor: ColorData.white,
          elevation: 8.0,
          showUnselectedLabels: true,
          selectedItemColor: ColorData.green0B,
          unselectedItemColor: ColorData.greyE8,
          selectedLabelStyle: Theme.of(context).textTheme.bodyText1.copyWith(
                fontWeight: FontWeight.w600,
              ),
          unselectedLabelStyle: Theme.of(context).textTheme.bodyText1.copyWith(
                fontWeight: FontWeight.normal,
              ),
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            landingProvider.setCurrentPage(index);
          },
          items: bottomNavbar(context).map(
            (BottomNavbarHelper item) {
              return BottomNavigationBarItem(
                icon: item.iconInactive,
                activeIcon: item.iconActive,
                label: item.title,
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
