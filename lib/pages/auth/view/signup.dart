import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roxo/Components/address_class.dart';
import 'package:roxo/pages/auth/components/header_widget.dart';
import 'package:roxo/pages/auth/controller/login_getx_conttroller.dart';
import 'package:roxo/pages/widgets/field.dart';
import 'package:roxo/routes/routes.dart';
import 'package:roxo/utils/services.dart';

import '../../../Theme/app_colors.dart';
import '../../../Theme/theme_helper.dart';
import '../components/app_validate.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final double _headerHeight = 200.h;
  final TextStyle _textStyle = AppServices.getLangBassedOnAppLang();
  final Map<String, dynamic> _dataregister = {};
  String? _pass;

  @override
  Widget build(BuildContext context) {
    Address _address = Address();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: _headerHeight,
                child: HeaderWidget(
                  height: _headerHeight,
                  showIcon: true,
                  title: "ROXN",
                  textStyle: _textStyle.copyWith(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
                          const SizedBox(height: 30),
                          GetBuilder<SignUpController>(
                            init: SignUpController(),
                            builder: (controller) {
                              return Column(
                                children: [
                                  //! First Name
                                  Field(
                                    hintText: 'Enter your First Name',
                                    focusNode: controller.signupFirstName,
                                    showtext: true,
                                    inputType: TextInputType.name,
                                    label: 'First Name',
                                    suffixcIcon: Icons.person,
                                    makeSufficIconButton: false,
                                    ontap: () => controller.update(),
                                    onSaved: (value) => _dataregister.addAll({"First Name": value}),
                                    validate: (value) => Appvalidate.name(value),
                                  ),
                                  const SizedBox(height: 20),
                                  //! Last Name
                                  Field(
                                    hintText: 'Enter your Last Name',
                                    focusNode: controller.signupLastName,
                                    showtext: true,
                                    inputType: TextInputType.name,
                                    label: 'Last Name',
                                    suffixcIcon: null,
                                    makeSufficIconButton: false,
                                    ontap: () => controller.update(),
                                    onSaved: (value) => _dataregister.addAll({"Last Name": value}),
                                    validate: (value) => Appvalidate.name(value),
                                  ),
                                  const SizedBox(height: 20.0),
                                  //! Email
                                  Field(
                                    hintText: 'Enter your Email',
                                    focusNode: controller.signupEmail,
                                    showtext: true,
                                    inputType: TextInputType.name,
                                    label: 'E-mail address',
                                    suffixcIcon: Icons.email,
                                    makeSufficIconButton: false,
                                    ontap: () => controller.update(),
                                    onSaved: (value) => _dataregister.addAll({"Email": value}),
                                    validate: (value) => Appvalidate.isEmail(value),
                                  ),
                                  const SizedBox(height: 20.0),
                                  //! Password
                                  Field(
                                    onchange: (value) => _pass = value,
                                    validate: (value) => Appvalidate.isPass(value),
                                    onSaved: (value) => _dataregister.addAll({"Password": value}),
                                    hintText: "Enter your Password",
                                    focusNode: controller.signupPassword,
                                    showtext: controller.signupshowPassword,
                                    inputType: TextInputType.visiblePassword,
                                    label: "Password",
                                    suffixcIcon: controller.signupshowPassword ? Icons.visibility : Icons.visibility_off,
                                    makeSufficIconButton: true,
                                    ontap: () => controller.update(),
                                    suffixiconontap: () => controller.signupshowPasswordfun(),
                                  ),
                                  const SizedBox(height: 20.0),
                                  //! confirm Password
                                  Field(
                                    hintText: "Confirm Password",
                                    focusNode: controller.signupconfirmPassword,
                                    showtext: controller.signupshowconfirmPassword,
                                    inputType: TextInputType.visiblePassword,
                                    label: "Confirm Password",
                                    suffixcIcon: controller.signupshowconfirmPassword ? Icons.visibility : Icons.visibility_off,
                                    makeSufficIconButton: true,
                                    ontap: () => controller.update(),
                                    suffixiconontap: () => controller.signupshowconfirmPasswordfun(),
                                    onSaved: (value) => _dataregister.addAll({"Confirm Password": value}),
                                    validate: (value) {
                                      if (_pass == null) {
                                        return Appvalidate.isPass(value);
                                      } else {
                                        return Appvalidate.isEqualPass(value, _pass ?? "");
                                      }
                                    },
                                  ),
                                  const SizedBox(height: 20.0),
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
                                    onchange: (p0) => _address.cityName = p0,
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
                                    onchange: (p0) => _address.cityCode = p0,
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
                                    onchange: (p0) => _address.streetName = p0,
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
                                    onchange: (p0) => _address.houseNum = p0,
                                  ),
                                ],
                              );
                            },
                          ),
                          const SizedBox(height: 15.0),
                          GetBuilder<CheckBoxController>(
                            init: CheckBoxController(),
                            builder: (controller) {
                              return Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Checkbox(activeColor: AppColors.activeDotColor, value: controller.checkboxValue, onChanged: (value) => controller.checkbox(value: value!)),
                                      const Text(
                                        "I accept all terms and conditions.",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "",
                                      textAlign: TextAlign.left,
                                      style: _textStyle.copyWith(
                                        color: Theme.of(context).errorColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                            // validator: (value) {
                            //   if (!checkboxValue) {
                            //     return 'You need to accept terms and conditions';
                            //   } else {
                            //     return null;
                            //   }
                            // },
                          ),
                          //! Sign up
                          Container(
                            decoration: ThemeHelper().buttonBoxDecoration(context),
                            child: ElevatedButton(
                              style: ThemeHelper().buttonStyle(raduis: 30),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                child: Text(
                                  "Register".toUpperCase(),
                                  style: _textStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Address.addresses.add(_address);
                                  Get.toNamed(Routes.mainpage);
                                }
                              },
                            ),
                          ),
                          //! Loogin
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                            //child: Text('Don\'t have an account? Create'),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "Already have an account? ",
                                  ),
                                  TextSpan(
                                    text: 'Login',
                                    recognizer: TapGestureRecognizer()..onTap = () => Get.toNamed(Routes.login),
                                    style: _textStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.activeDotColor,
                                    ),
                                  ),
                                ],
                              ),
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
