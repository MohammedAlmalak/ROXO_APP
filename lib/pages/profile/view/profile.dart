import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Theme/app_colors.dart';
import '../../../translation/translate.dart';
import '../components/favourite.dart';
import '../components/info.dart';
import '../components/last_view.dart';
import '../components/local_shipping.dart';
import '../components/notifications.dart';
import '../components/profile_image.dart';
import '../components/profile_section_row.dart';
import '../components/settings.dart';

class Profile extends StatefulWidget {
  const Profile({
    Key? key,
    required TextStyle textStyle,
  })  : _textStyle = textStyle,
        super(key: key);
  final TextStyle _textStyle;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final List<IconData> _icons = [
    Icons.access_time_outlined,
    Icons.favorite,
    Icons.local_shipping,
    Icons.notifications,
    Icons.settings,
    Icons.info,
  ];
  final List<String> _names = [
    "Lastview",
    "My Favourites",
    "My order",
    "Notifications",
    "Settings",
    "Info",
  ];
  final options = const LiveOptions(
    delay: Duration(seconds: 0),
    showItemInterval: Duration(milliseconds: 150),
    showItemDuration: Duration(milliseconds: 150),
    visibleFraction: 0.05,
    reAnimateOnVisibility: false,
  );
  final List<Widget> _pages = const [
    LastView(),
    Favourite(),
    LocalShipping(),
    ProfileNotifications(),
    ProfileSettings(),
    Info(),
  ];
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          //! remove back arrow from sliverappbar
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          pinned: false,
          centerTitle: true,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "My Profile",
                style: widget._textStyle.copyWith(
                  fontWeight: FontWeight.normal,
                  color: AppColors.activeDotColor,
                  fontSize: 16.sp,
                ),
              ),
              IconButton(
                  onPressed: () {
                    if (Get.locale!.languageCode == 'en') {
                      Get.find<TranslationService>().updateLocale('ar');
                    } else {
                      Get.find<TranslationService>().updateLocale('en_US');
                    }
                  },
                  icon: Icon(
                    Icons.language,
                    color: AppColors.activeDotColor,
                  ))
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 10,
          ),
        ),
        //! Top
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ProfileImage(textstyle: widget._textStyle),
                SizedBox(width: 15.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! Name
                    Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jack Aranda",
                            style: widget._textStyle.copyWith(
                              color: Colors.black,
                              fontSize: 14.sp,
                            ),
                          ),
                          //! Email
                          Text(
                            "JackAranda@gmail.com",
                            style: widget._textStyle.copyWith(
                              color: Colors.black,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //! Edit profile
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: SizedBox(
                          width: 120.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.edit,
                                color: AppColors.activeDotColor,
                                size: 28.sp,
                              ),
                              SizedBox(width: 12.w),
                              Text(
                                "Edit Profile",
                                style: widget._textStyle.copyWith(
                                  color: Colors.black,
                                  fontSize: 13.sp,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        //! Items
        LiveSliverList.options(
          controller: scrollController,
          itemBuilder: buildAnimatedItem,
          itemCount: _pages.length,
          options: options,
        ),
      ],
    );
  }

  Widget buildAnimatedItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) {
    return FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation),
      // And slide transition
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -0.1),
          end: Offset.zero,
        ).animate(animation),
        //!  Widget
        child: index != _pages.length - 1
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: ProfileSectionRow(
                  icon: _icons.elementAt(index),
                  textStyle: widget._textStyle,
                  title: _names.elementAt(index),
                  page: _pages.elementAt(index),
                ),
              )
            : Info(),
      ),
    );
  }
}
