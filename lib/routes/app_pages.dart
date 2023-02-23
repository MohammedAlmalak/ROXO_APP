import 'package:get/get.dart';
import 'package:roxo/routes/routes.dart';

import '../main_page.dart';
import '../pages/auth/view/forget_password.dart';
import '../pages/auth/view/login.dart';
import '../pages/auth/view/reset_passworrd.dart';
import '../pages/auth/view/signup.dart';
import '../pages/cart/view/cart.dart';
import '../pages/intro/view/intro_pages.dart';

class AppPages {
  static const iNITIAL = Routes.login;
  static const mainPage = Routes.mainpage;
  static final routes = [
    //! intro
    GetPage(
      name: Routes.intro,
      page: () => const IntroPages(), /*  binding: RootBinding() */
    ),
    //! signup
    GetPage(
      name: Routes.signUp,
      page: () => const SignUp(), /*  binding: RootBinding() */
    ),
    //! login
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(), /*  binding: RootBinding() */
    ),
    //! Forget Password
    GetPage(
      name: Routes.forgetPassword,
      page: () => const ForgetPassword(),
    ),
    //! Reset Password
    GetPage(
      name: Routes.resetPassword,
      page: () => const ResetPassword(),
    ),
    //! mainpage
    GetPage(
      name: Routes.mainpage,
      page: () => const MainPage(),
    ),
    //! Cart
    GetPage(
      name: Routes.cart,
      page: () => const Cart(
        iscomingfromitemdetails: true,
      ),
    ),
  ];
}
