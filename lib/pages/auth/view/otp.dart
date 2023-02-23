import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:roxo/pages/auth/components/header_widget.dart';
import 'package:roxo/utils/services.dart';

import '../../../Theme/app_colors.dart';
import '../../../Theme/theme_helper.dart';
import '../../../routes/routes.dart';

class Otp extends StatefulWidget {
  final String email;
  const Otp({Key? key, required this.email}) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    final double _headerHeight = 250.h;
    final TextStyle _textStyle = AppServices.getLangBassedOnAppLang();
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
              'Verification code',
              style: _textStyle.copyWith(
                fontSize: 25,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 10),
            //! msg
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "We have sent a code to\n",
                      style: _textStyle.copyWith(
                        fontSize: 17,
                      ),
                    ),
                    TextSpan(
                      text: "${widget.email}\n",
                      style: _textStyle.copyWith(
                        fontWeight: FontWeight.normal,
                        color: AppColors.activeDotColor,
                      ),
                    ),
                    TextSpan(
                      text: "Enter the code to continue ",
                      style: _textStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20.h),
            //! pin Code
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: PinCodeTextField(
                cursorColor: Colors.black,
                appContext: context,
                // controller: ,
                keyboardType: TextInputType.number,
                length: 5,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(12.r),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  activeColor: AppColors.activeDotColor,
                  borderWidth: 1,
                  selectedColor: AppColors.activeDotColor,
                  inactiveColor: Colors.grey[400],
                ),
                onChanged: (v) {},
                onCompleted: (v) {},
              ),
            ),
            const SizedBox(height: 15),
            //! Send Code
            ElevatedButton(
              style: ThemeHelper().buttonStyle(raduis: 10),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                child: Text(
                  'Continue',
                  style: _textStyle.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ),
              onPressed: () {
                Get.offNamed(Routes.resetPassword);
              },
            ),
          ],
        ),
      ),
    ));
  }
}
