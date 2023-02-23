import 'package:get/get.dart';

class DarkModeController extends GetxController {
  int _value = 0;
  int get getvaleu => _value;
  set setvale(int value) {
    _value = value;
    update();
  }
}
