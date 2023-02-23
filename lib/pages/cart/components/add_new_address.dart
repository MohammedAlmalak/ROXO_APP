import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roxo/pages/auth/components/app_validate.dart';
import 'package:roxo/pages/widgets/field.dart';
import 'package:roxo/utils/services.dart';

import '../../../Components/address_class.dart';
import '../../../Theme/app_colors.dart';
import '../../../Theme/theme_helper.dart';
import '../../auth/controller/login_getx_conttroller.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final double _headerHeight = 55.h;
    final TextStyle _textStyle = AppServices.getLangBassedOnAppLang();
    Address _address = Address();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: AppColors.activeDotColor,
                height: _headerHeight,
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
                        "Add New Address",
                        style: _textStyle.copyWith(
                          color: AppColors.white,
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 20.h),
                          GetBuilder<SignUpController>(
                            init: SignUpController(),
                            builder: (controller) {
                              return Column(
                                children: [
                                  const SizedBox(height: 20),
                                  //! Address
                                  //? city Name
                                  Field(
                                    hintText: 'Enter your City Name',
                                    focusNode: controller.cityname,
                                    showtext: true,
                                    inputType: TextInputType.name,
                                    label: 'City Name',
                                    suffixcIcon: Icons.location_city_outlined,
                                    makeSufficIconButton: false,
                                    ontap: () => controller.update(),
                                    onchange: (value) => _address.cityName = value,
                                    validate: (value) => Appvalidate.isEmpty(value),
                                  ),
                                  const SizedBox(height: 20.0),
                                  //? city Code
                                  Field(
                                    hintText: 'Enter your city Code',
                                    focusNode: controller.citynum,
                                    showtext: true,
                                    inputType: TextInputType.number,
                                    label: 'city Code',
                                    suffixcIcon: Icons.business,
                                    makeSufficIconButton: false,
                                    ontap: () => controller.update(),
                                    onchange: (value) => _address.cityCode = value,
                                    validate: (value) => Appvalidate.isEmpty(value),
                                  ),
                                  const SizedBox(height: 20.0),
                                  //? Street Name
                                  Field(
                                    hintText: 'Enter your Street Name',
                                    focusNode: controller.streetname,
                                    showtext: true,
                                    inputType: TextInputType.streetAddress,
                                    label: 'Street Name',
                                    suffixcIcon: Icons.add_road,
                                    makeSufficIconButton: false,
                                    ontap: () => controller.update(),
                                    onchange: (value) => _address.streetName = value,
                                    validate: (value) => Appvalidate.isEmpty(value),
                                  ),
                                  const SizedBox(height: 20.0),
                                  //? House Number
                                  Field(
                                    hintText: 'Enter your House Number',
                                    focusNode: controller.homenum,
                                    showtext: true,
                                    inputType: TextInputType.number,
                                    label: 'House Number',
                                    suffixcIcon: Icons.house,
                                    makeSufficIconButton: false,
                                    ontap: () => controller.update(),
                                    onchange: (value) => _address.houseNum = value,
                                    validate: (value) => Appvalidate.isEmpty(value),
                                  ),
                                ],
                              );
                            },
                          ),
                          const SizedBox(height: 15.0),
                          //! Add Address
                          Container(
                            decoration: ThemeHelper().buttonBoxDecoration(context),
                            child: ElevatedButton(
                              style: ThemeHelper().buttonStyle(raduis: 10.r),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                child: Text(
                                  "Add Address".toUpperCase(),
                                  style: _textStyle.copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Address.addresses.add(_address);
                                  Get.back();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
