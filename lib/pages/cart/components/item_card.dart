import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Components/cart_items.dart';
import '../../../Theme/app_colors.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.itemImage,
    required this.itemName,
    required this.itemNum,
    required this.itemprice,
    required this.textstyle,
    required this.index,
  }) : super(key: key);
  final String itemName;
  final String itemImage;
  final double itemprice;
  final int itemNum;
  final TextStyle textstyle;
  final int index;
  @override
  Widget build(BuildContext context) {
    CartItems _cartitem = Get.put(CartItems());
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      elevation: 3.5,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(itemImage),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Text(
                    itemName,
                    style: textstyle.copyWith(
                      fontSize: 15.sp,
                      color: AppColors.gray,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "$itemprice \$",
                        style: textstyle.copyWith(
                          fontSize: 13.sp,
                          color: AppColors.activeDotColor,
                        ),
                      ),
                      //! inc and dec
                      GetBuilder<CartItems>(
                        init: CartItems(),
                        builder: (controller) {
                          return Row(
                            children: [
                              //! inc
                              InkWell(
                                child: Icon(
                                  Icons.add_circle_outline_outlined,
                                  color: AppColors.activeDotColor,
                                ),
                                onTap: () {
                                  controller.incremant(index, 1, itemName);
                                  CartItems.getitemPrice();
                                  controller.update();
                                  _cartitem.update();
                                },
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                CartItems.items.elementAt(index)[itemName]!.itemNum.toString(),
                                style: textstyle.copyWith(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              //! dec
                              InkWell(
                                child: Icon(
                                  Icons.remove_circle_outline_outlined,
                                  color: AppColors.gray,
                                ),
                                onTap: () {
                                  controller.decremnt(index, 1, itemName);
                                  CartItems.getitemPrice();
                                  controller.update();
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
