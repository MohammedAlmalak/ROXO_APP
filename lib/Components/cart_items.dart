import 'package:get/get.dart';

class CartItems extends GetxController {
  static final List<Map<String, CartItems>> items = [];
  static int numOfItemPerEachElement = 0;

  //! ///////////////////////////
  String itemName = "";
  String itemImage = "";
  double itemPrice = 0.0;
  int itemNum = 0;
  static double getitemPrice() {
    double sum = 0.0;
    for (Map<String, CartItems> item in items) {
      for (CartItems itemdetails in item.values) {
        sum += (itemdetails.itemPrice * itemdetails.itemNum);
      }
    }

    return sum;
  }

  void incremant(int index, int incValue, String itemName) {
    CartItems.items.elementAt(index)[itemName]!.itemNum += incValue;
    CartItems.numOfItemPerEachElement += incValue;
  }

  void decremnt(int index, int decValue, String itemName) {
    if (CartItems.items.elementAt(index)[itemName]!.itemNum != 1) {
      CartItems.items.elementAt(index)[itemName]!.itemNum -= decValue;
      CartItems.numOfItemPerEachElement -= decValue;
    } else {
      if (CartItems.items.isNotEmpty) {
        CartItems.numOfItemPerEachElement = 0;
        CartItems.items.removeAt(index);
      }
    }
  }
}
