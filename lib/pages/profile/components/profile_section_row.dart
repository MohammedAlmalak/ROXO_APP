import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Theme/app_colors.dart';

class ProfileSectionRow extends StatelessWidget {
  const ProfileSectionRow({
    Key? key,
    required this.icon,
    required this.textStyle,
    required this.title,
    required this.page,
  }) : super(key: key);
  final IconData icon;
  final TextStyle textStyle;
  final String title;
  final Widget page;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 2,
          child: Padding(
            padding: EdgeInsets.all(12.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150.w,
                  child: Row(
                    children: [
                      Icon(
                        icon,
                        color: AppColors.activeDotColor,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        title,
                        style: textStyle.copyWith(
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.activeDotColor,
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () => Get.to(() => page),
    );
  }
}
