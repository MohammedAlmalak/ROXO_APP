import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roxo/Components/cart_items.dart';

import '../Theme/app_colors.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({Key? key, required this.onTap}) : super(key: key);
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        width: 30.w,
        height: 45.h,
        child: GetBuilder<CartItems>(
          init: CartItems(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Badge(
                alignment: Alignment.centerRight,
                badgeColor: AppColors.activeDotColor,
                badgeContent: Text(
                  CartItems.numOfItemPerEachElement.toString(),
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 10.sp,
                  ),
                ),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.grey,
                ),
              ),
            );
          },
        ),
      ),
      onTap: onTap,
    );
  }
}
