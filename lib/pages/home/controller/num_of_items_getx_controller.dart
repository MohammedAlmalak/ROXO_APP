import 'package:get/get.dart';

class ItemCounter extends GetxController {
  //! num of items
  int items = 1;
  void incremant() {
    items++;
    update();
  }

  void decremnt() {
    if (items != 1) {
      items--;
      update();
    } else {
      items = 1;
    }
  }

  set resetitems(int reset) {
    items = reset;
  }
}

class Showmore extends GetxController {
  bool isExpanded = false;
  void showtext() {
    isExpanded = true;
    update();
  }
}
