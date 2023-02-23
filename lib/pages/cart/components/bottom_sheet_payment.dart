import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Theme/app_colors.dart';
import '../../../utils/roxn_icon_icons.dart';
import 'credit_card.dart';

Future bottomSheetPayment({
  required BuildContext context,
  required TextStyle textStyle,
}) {
  List<IconData> _icons = [
    Icons.credit_card,
    Icons.payments_rounded,
    RoxnIcon.paypal,
  ];
  List<String> _iconsname = ["Credit card", "Cash on Deliverry", "PayPal"];
  List<Widget> _pages = [
    CreditCard(
      textStyle: textStyle,
    ),
  ];
  return showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40.r),
        topRight: Radius.circular(40.r),
      ),
    ),
    context: context,
    builder: (builder) {
      return Container(
        height: 300.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.r),
            topRight: Radius.circular(40.r),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Choose Payment Method",
                  style: textStyle.copyWith(
                    color: AppColors.activeDotColor,
                    fontSize: 13.sp,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 0,
                      ),
                      child: InkWell(
                        child: Material(
                          borderRadius: BorderRadius.circular(12),
                          elevation: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.activeDotColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  _icons.elementAt(index),
                                  color: Colors.black,
                                  size: 18.sp,
                                ),
                                Text(
                                  _iconsname.elementAt(index),
                                  style: textStyle.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () => Get.to(() => _pages.elementAt(index)),
                      ),
                    );
                  },
                  itemCount: _icons.length,
                  shrinkWrap: true,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
