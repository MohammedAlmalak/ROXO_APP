import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roxo/utils/services.dart';

import '../../../Theme/app_colors.dart';

class CreditCardInput extends StatelessWidget {
  const CreditCardInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle _textStyle = AppServices.getLangBassedOnAppLang();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: AppColors.activeDotColor,
                height: 55.h,
                width: double.infinity,
                child: Center(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.white,
                        ),
                      ),
                      Text(
                        "Add New Cart",
                        style: _textStyle.copyWith(
                          color: AppColors.white,
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
