import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roxo/pages/auth/components/app_validate.dart';
import 'package:roxo/pages/auth/controller/login_getx_conttroller.dart';
import 'package:roxo/pages/widgets/field.dart';
import 'package:roxo/utils/services.dart';

import '../../../Theme/theme_helper.dart';
import '../../../routes/routes.dart';
import '../components/header_widget.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    final double _headerHeight = 250.h;
    final TextStyle _textStyle = AppServices.getLangBassedOnAppLang();
    final Map<String, dynamic> _dataregister = {};
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String? _pass;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              //! header
              SizedBox(
                height: _headerHeight,
                child: HeaderWidget(
                  height: _headerHeight,
                  showIcon: true,
                  icon: Icons.lock,
                  title: "Reset Password",
                  textStyle: _textStyle.copyWith(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ), //let's create a common header widget
              ),
              const SizedBox(
                height: 25,
              ),
              //! Title
              Text(
                'New Password',
                style: _textStyle.copyWith(
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 10),
              //! msg
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "Enter the new password",
                  textAlign: TextAlign.center,
                  style: _textStyle.copyWith(
                    fontSize: 15,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: GetBuilder<SignUpController>(
                    init: SignUpController(),
                    builder: (controller) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            //! Password
                            Field(
                              onchange: (value) => _pass = value,
                              validate: (value) => Appvalidate.isPass(value),
                              onSaved: (value) => _dataregister.addAll({"Password": value}),
                              hintText: "Enter your New Password",
                              focusNode: controller.signupPassword,
                              showtext: controller.signupshowPassword,
                              inputType: TextInputType.visiblePassword,
                              label: "New Password",
                              suffixcIcon: controller.signupshowPassword ? Icons.visibility : Icons.visibility_off,
                              makeSufficIconButton: true,
                              ontap: () => controller.update(),
                              suffixiconontap: () => controller.signupshowPasswordfun(),
                            ),
                            const SizedBox(height: 20.0),
                            //! confirm Password
                            Field(
                              hintText: "Re-Enter New Password",
                              focusNode: controller.signupconfirmPassword,
                              showtext: controller.signupshowconfirmPassword,
                              inputType: TextInputType.visiblePassword,
                              label: "Confirm New Password",
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
                            //! Done
                            const SizedBox(height: 30.0),
                            Container(
                              decoration: ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(raduis: 30),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text(
                                    "Done".toUpperCase(),
                                    style: _textStyle.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Get.offNamed(Routes.login);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
