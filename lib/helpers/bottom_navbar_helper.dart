import 'package:flutfood/routes/stack/home_route.dart';
import 'package:flutter/material.dart';
import 'package:flutfood/commons/text_data.dart';
import 'package:flutfood/widgets/image_svg_widget.dart';

class BottomNavbarHelper {
  const BottomNavbarHelper(
    this.title,
    this.iconActive,
    this.iconInactive,
  );

  final String title;
  final Widget iconActive;
  final Widget iconInactive;
}

List<BottomNavbarHelper> bottomNavbar(BuildContext context) {
  return const <BottomNavbarHelper>[
    BottomNavbarHelper(
      TextData.textHome,
      ImageSvgWidget(
        imagePath: 'assets/buttons/home_active.svg',
        height: 20.0,
        width: 20.0,
        isNeedLoading: false,
      ),
      ImageSvgWidget(
        imagePath: 'assets/buttons/home_inactive.svg',
        height: 20.0,
        width: 20.0,
        isNeedLoading: false,
      ),
    ),
    BottomNavbarHelper(
      TextData.textCart,
      ImageSvgWidget(
        imagePath: 'assets/buttons/cart_active.svg',
        height: 20.0,
        width: 20.0,
        isNeedLoading: false,
      ),
      ImageSvgWidget(
        imagePath: 'assets/buttons/cart_inactive.svg',
        height: 20.0,
        width: 20.0,
        isNeedLoading: false,
      ),
    ),
    BottomNavbarHelper(
      TextData.textHelp,
      ImageSvgWidget(
        imagePath: 'assets/buttons/help_active.svg',
        height: 20.0,
        width: 20.0,
        isNeedLoading: false,
      ),
      ImageSvgWidget(
        imagePath: 'assets/buttons/help_inactive.svg',
        height: 20.0,
        width: 20.0,
        isNeedLoading: false,
      ),
    ),
    BottomNavbarHelper(
      TextData.textAccount,
      ImageSvgWidget(
        imagePath: 'assets/buttons/account_active.svg',
        height: 20.0,
        width: 20.0,
        isNeedLoading: false,
      ),
      ImageSvgWidget(
        imagePath: 'assets/buttons/account_inactive.svg',
        height: 20.0,
        width: 20.0,
        isNeedLoading: false,
      ),
    ),
  ];
}

List<Widget> bottomNavbarRoute() {
  return [
    HomeRoute(),
    Container(),
    Container(),
    Container(),
  ];
}
