import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roxo/pages/auth/components/app_validate.dart';
import 'package:roxo/pages/auth/components/header_widget.dart';
import 'package:roxo/pages/widgets/field.dart';
import 'package:roxo/utils/services.dart';

import '../../../Theme/theme_helper.dart';
import '../../../routes/routes.dart';
import '../controller/login_getx_conttroller.dart';
import 'otp.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    final TextStyle _textStyle = AppServices.getLangBassedOnAppLang();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final double _headerHeight = 200.h;
    String _email = "";
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                //! header
                SizedBox(
                  height: _headerHeight,
                  child: HeaderWidget(
                    height: _headerHeight,
                    showIcon: true,
                    icon: Icons.lock,
                    title: "Forget Password",
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
                  'Reset Password',
                  style: _textStyle.copyWith(
                    fontSize: 25,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 10),
                //! msg
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    "To be able to reset your password, we will send an activation code to your email",
                    textAlign: TextAlign.center,
                    style: _textStyle.copyWith(
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                //! Email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GetBuilder<LoginController>(
                    init: LoginController(),
                    builder: (controller) {
                      return Field(
                        hintText: "Enter your Email",
                        focusNode: controller.loginEmail,
                        showtext: true,
                        inputType: TextInputType.emailAddress,
                        label: "Email",
                        suffixcIcon: Icons.email,
                        makeSufficIconButton: false,
                        ontap: () => controller.update(),
                        validate: (value) => Appvalidate.isEmail(value),
                        onchange: (value) => _email = value,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30),
                //! Send Code
                ElevatedButton(
                  style: ThemeHelper().buttonStyle(raduis: 30),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(75, 0, 75, 0),
                    child: Text(
                      'Send Code'.toUpperCase(),
                      style: _textStyle.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onPressed: () {
                    //After successful login we will redirect to profile page. Let's create profile page now
                    if (_formKey.currentState!.validate()) {
                      Get.to(
                        () => Otp(
                          email: _email,
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 90),
                //! Loogin
                InkWell(
                  child: Text(
                    'Login',
                    style: _textStyle.copyWith(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                      fontSize: 17,
                    ),
                  ),
                  onTap: () => Get.offNamed(Routes.login),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
