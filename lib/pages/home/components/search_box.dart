import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Theme/app_colors.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key, required this.hintStyle}) : super(key: key);
  final TextStyle hintStyle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        width: 280.w,
        height: 37.h,
        decoration: BoxDecoration(
          color: AppColors.searchBackGroun,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 5.w,
            ),
            Expanded(
              child: TextFormField(
                cursorColor: AppColors.gray,
                style: TextStyle(color: AppColors.activeDotColor),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.only(top: 2),
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Icon(
                      Icons.search,
                      color: AppColors.gray,
                    ),
                  ),
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: hintStyle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
