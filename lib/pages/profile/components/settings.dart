import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Theme/app_colors.dart';
import '../../../utils/services.dart';
import '../controller/darkmod_controller.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({
    Key? key,
  }) : super(key: key);
  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = AppServices.getLangBassedOnAppLang();
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              //! remove back arrow from sliverappbar
              automaticallyImplyLeading: true,
              backgroundColor: Colors.white,
              pinned: false,
              centerTitle: true,
              leading: InkWell(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.activeDotColor,
                ),
                onTap: () => Get.back(),
              ),
              title: Text(
                "Settings",
                style: textStyle.copyWith(
                  fontWeight: FontWeight.normal,
                  color: AppColors.activeDotColor,
                  fontSize: 18.sp,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            //! Account
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Account",
                  style: textStyle.copyWith(
                    color: AppColors.activeDotColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  rowtitle(title: "Adresses", textStyle: textStyle),
                  rowtitle(title: "Telephone", textStyle: textStyle),
                  rowtitle(title: "Email", textStyle: textStyle),
                ],
              ),
            ),
            //! Settings
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Settings",
                  style: textStyle.copyWith(
                    color: AppColors.activeDotColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  rowtitle(title: "Notifications", textStyle: textStyle),
                  rowtitle(title: "Dark Mode", textStyle: textStyle),
                  rowtitle(title: "Languages", textStyle: textStyle),
                ],
              ),
            ), //! Logut
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Logout",
                      style: textStyle.copyWith(
                        color: AppColors.activeDotColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.logout,
                        color: AppColors.activeDotColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rowtitle({required String title, required TextStyle textStyle}) {
    Widget iconBuilder(int i, Size size, bool active) {
      IconData data = Icons.light_mode_rounded;
      if (i == 1) data = Icons.dark_mode_outlined;
      if (i == 2) data = Icons.brightness_auto_outlined;
      return Icon(
        data,
        size: 18.sp,
        color: active ? AppColors.white : AppColors.gray,
      );
    }

    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 2,
          child: Padding(
            padding: EdgeInsets.all(title == "Dark Mode" ? 7.sp : 16.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: textStyle.copyWith(
                    color: Colors.black,
                    fontSize: 12.sp,
                  ),
                ),
                title == "Dark Mode"
                    ? GetBuilder<DarkModeController>(
                        init: DarkModeController(),
                        builder: (controller) {
                          return AnimatedToggleSwitch<int>.rolling(
                            borderColor: Colors.transparent,
                            indicatorColor: AppColors.activeDotColor,
                            current: controller.getvaleu,
                            values: const [0, 1, 2],
                            onChanged: (i) => controller.setvale = i,
                            iconBuilder: iconBuilder,
                            innerColor: AppColors.white,
                            height: 45.h,
                            indicatorSize: Size(30.0.w, 0.h),
                            selectedIconRadius: 8,
                            iconRadius: 2,
                            borderWidth: 1.5,
                          );
                        },
                      )
                    : Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.activeDotColor,
                      )
              ],
            ),
          ),
        ),
      ),
      onTap: () {},
    );
  }
}
