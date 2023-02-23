import 'package:flutter/material.dart';

class AppColors {
  // * Convert Color from Hex to type Flutter 0xFFDDDDDD
  static Color colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  // * loading
  static final Color activeDotColor = colorFromHex('#BF162E');
  static final Color loginbackgroundColor = colorFromHex('#F5F5F5');
  static final Color gray = colorFromHex("#89898A");
  static final Color searchBackGroun = colorFromHex("#dedede");
  static final Color white = colorFromHex("#fefefe");
}
