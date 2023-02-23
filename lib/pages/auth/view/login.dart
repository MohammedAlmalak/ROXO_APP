import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roxo/pages/auth/components/app_validate.dart';
import '../../../Theme/app_colors.dart';
import '../../../Theme/theme_helper.dart';
import '../../../routes/routes.dart';
import '../../../utils/services.dart';
import '../../widgets/field.dart';
import '../components/header_widget.dart';
import '../controller/login_getx_conttroller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final double _headerHeight = 200.h;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _datalogin = {};
  final TextStyle _textStyle = AppServices.getLangBassedOnAppLang();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                ), //let's create a common header widget
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10), // This will be the login form
                child: Column(
                  children: [
                    Text(
                      'Hello',
                      style: _textStyle.copyWith(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Signin into your account',
                      style: _textStyle.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 30.0.h),
                    Form(
                      key: _formKey,
                      child: GetBuilder<LoginController>(
                        init: LoginController(),
                        builder: (controller) {
                          return Column(
                            children: [
                              //! Email
                              Field(
                                hintText: "Enter your Email",
                                focusNode: controller.loginEmail,
                                showtext: true,
                                inputType: TextInputType.emailAddress,
                                label: "Email",
                                suffixcIcon: Icons.email,
                                makeSufficIconButton: false,
                                ontap: () => controller.update(),
                                validate: (value) => Appvalidate.isEmail(value),
                                onSaved: (value) => _datalogin.addAll({"Email": value}),
                              ),
                              SizedBox(height: 15.0.h),
                              //! Password
                              Field(
                                hintText: "Enter your Password",
                                focusNode: controller.loginPassword,
                                showtext: controller.loginshowpassword,
                                inputType: TextInputType.visiblePassword,
                                label: "Password",
                                suffixcIcon: controller.loginshowpassword ? Icons.visibility : Icons.visibility_off,
                                makeSufficIconButton: true,
                                ontap: () => controller.update(),
                                suffixiconontap: () => controller.loginshowPassword(),
                                onSaved: (value) => _datalogin.addAll({"Passwod": value}),
                                validate: (value) => Appvalidate.isPass(value),
                              ),
                              const SizedBox(height: 15.0),
                              //! Forget password
                              Container(
                                margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () => Get.offNamed(Routes.forgetPassword),
                                  child: Text(
                                    "Forgot your Password?",
                                    style: _textStyle.copyWith(color: Colors.grey),
                                  ),
                                ),
                              ),
                              //! login
                              Container(
                                decoration: ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(raduis: 30),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text(
                                      'Sign In'.toUpperCase(),
                                      style: _textStyle.copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    //! After successful login we will redirect to profile page. Let's create profile page now
                                    if (_formKey.currentState!.validate()) {
                                      Get.toNamed(Routes.mainpage);
                                    }
                                  },
                                ),
                              ),
                              //! Sign up
                              Container(
                                margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                //child: Text('Don\'t have an account? Create'),
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: "Don't have an account? ",
                                      ),
                                      TextSpan(
                                        text: 'Create',
                                        recognizer: TapGestureRecognizer()..onTap = () => Get.toNamed(Routes.signUp),
                                        style: _textStyle.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.activeDotColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              //! Skip For now
                              InkWell(
                                onTap: () => Get.offNamed(Routes.mainpage),
                                child: Text(
                                  "Skip For Now",
                                  style: _textStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.activeDotColor,
                                  ),
                                ),
                              )
                            ],
                          );
                        },
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
