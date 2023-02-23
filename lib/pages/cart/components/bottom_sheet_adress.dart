import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Components/address_class.dart';
import '../../../Theme/app_colors.dart';
import 'add_new_address.dart';

Future bottomSheetAdress({
  required BuildContext context,
  required ValueChanged<String> addresschange,
  required String address,
  required TextStyle textStyle,
}) {
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
        height: 200.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.r),
            topRight: Radius.circular(40.r),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Choose Address",
                    style: textStyle.copyWith(
                      color: AppColors.activeDotColor,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                //! Content
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (Address.addresses.isEmpty) ...[
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "There is no address ",
                                  style: textStyle.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: "Add Adress",
                                  recognizer: TapGestureRecognizer()..onTap = () => Get.to(() => const AddNewAddress()),
                                  style: textStyle.copyWith(
                                    color: AppColors.activeDotColor,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ] else ...[
                          Expanded(
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
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
                                            Text(
                                              "Ciyt Name : ${Address.addresses.elementAt(index).cityName}",
                                              style: textStyle.copyWith(
                                                color: Colors.black,
                                              ),
                                            ),
                                            Text(
                                              "House Number : ${Address.addresses.elementAt(index).houseNum}",
                                              style: textStyle.copyWith(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      addresschange(
                                        Address.addresses.elementAt(index).cityName,
                                      );
                                      Get.back();
                                    },
                                  ),
                                );
                              },
                              itemCount: Address.addresses.length,
                            ),
                          ),
                        ]
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
