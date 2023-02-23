import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roxo/pages/intro/components/intro_screen.dart';
import 'package:roxo/pages/intro/components/intro_screens.dart';

import '../../../Theme/app_colors.dart';
import '../../../routes/routes.dart';

class IntroPages extends StatefulWidget {
  const IntroPages({Key? key}) : super(key: key);

  @override
  _IntroPagesState createState() => _IntroPagesState();
}

class _IntroPagesState extends State<IntroPages> {
  final List<IntroScreen> _pages = [
    IntroScreen(
      title: 'Search',
      imageAsset: 'assets/images/introScreens/undraw_shopping_app_flsj.png',
      description: 'Quickly find all your messages',
      textColor: AppColors.activeDotColor,
    ),
    IntroScreen(
      title: 'Focused Inbox',
      textColor: AppColors.activeDotColor,
      imageAsset: 'assets/images/introScreens/undraw_online_groceries_a02y.png',
      description: "Keep talking with your mates",
    ),
    IntroScreen(
      title: 'Social',
      headerPadding: EdgeInsets.zero,
      textColor: AppColors.activeDotColor,
      imageAsset: 'assets/images/introScreens/undraw_Order_confirmed_re_g0if.png',
      description: "Keep talking with your mates",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    IntroScreens _introScreens = IntroScreens(
      skipText: "skip",
      footerBgColor: Colors.transparent,
      activeDotColor: AppColors.activeDotColor,
      skipColor: AppColors.activeDotColor,
      textColor: AppColors.activeDotColor,
      footerRadius: 18.0.r,
      indicatorType: IndicatorType.CIRCLE,
      slides: _pages,
      onDone: () => Get.offNamed(Routes.mainpage),
      onSkip: () => Get.offNamed(Routes.mainpage),
    );
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: _introScreens,
      ),
    );
  }
}
