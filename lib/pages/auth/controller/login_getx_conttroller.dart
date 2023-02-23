import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //! Login
  FocusNode loginEmail = FocusNode();
  FocusNode loginPassword = FocusNode();
  //! Show Password
  bool loginshowpassword = false;
  void loginshowPassword() {
    loginshowpassword = !loginshowpassword;
    update();
  }
}

class SignUpController extends GetxController {
  //! Sign Up
  //? Name
  FocusNode signupFirstName = FocusNode();
  FocusNode signupLastName = FocusNode();
  //? Email
  FocusNode signupEmail = FocusNode();
  //? password
  FocusNode signupPassword = FocusNode();
  FocusNode signupconfirmPassword = FocusNode();
  //? Address
  FocusNode cityname = FocusNode();
  FocusNode streetname = FocusNode();
  FocusNode citynum = FocusNode();
  FocusNode homenum = FocusNode();
  //! Show Password

  bool signupshowPassword = false;
  bool signupshowconfirmPassword = false;
  double move = 0.0;

  void signupshowPasswordfun() {
    signupshowPassword = !signupshowPassword;
    update();
  }

  void signupshowconfirmPasswordfun() {
    signupshowconfirmPassword = !signupshowconfirmPassword;
    update();
  }

  void animated() {
    move = 0.1;
    update();
  }
}

class CheckBoxController extends GetxController {
  //! SignUp checkBox
  bool checkedValue = false;
  bool checkboxValue = false;

  void checkbox({required bool value}) {
    checkboxValue = value;
    update();
  }
}
