import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roxo/Theme/app_colors.dart';
import 'package:roxo/pages/cart/components/add_new_address.dart';
import 'package:roxo/pages/cart/components/item_card.dart';
import 'package:roxo/utils/services.dart';

import '../../../Components/cart_items.dart';
import '../components/bottom_sheet_adress.dart';
import '../components/bottom_sheet_payment.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key, required this.iscomingfromitemdetails}) : super(key: key);
  final bool iscomingfromitemdetails;
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  String _address = "Selected Address";
  final List<CartItems> _listItems = [];
  CartItems _tempobj = CartItems();
  @override
  Widget build(BuildContext context) {
    for (var item in CartItems.items) {
      for (var itemdetails in item.values) {
        _tempobj.itemImage = itemdetails.itemImage;
        _tempobj.itemName = itemdetails.itemName;
        _tempobj.itemNum = itemdetails.itemNum;
        _tempobj.itemPrice = itemdetails.itemPrice;
      }
      _listItems.add(_tempobj);
      _tempobj = CartItems();
    }
    final TextStyle _textStyle = AppServices.getLangBassedOnAppLang();
    const options = LiveOptions(
      delay: Duration(seconds: 0),
      showItemInterval: Duration(milliseconds: 150),
      showItemDuration: Duration(milliseconds: 150),
      visibleFraction: 0.05,
      reAnimateOnVisibility: false,
    );
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<CartItems>(
          init: CartItems(),
          builder: (controller) {
            return CustomScrollView(
              slivers: [
                //! Title
                SliverAppBar(
                  //! remove back arrow from sliverappbar
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  pinned: false,
                  centerTitle: true,
                  leading: widget.iscomingfromitemdetails
                      ? InkWell(
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.activeDotColor,
                            size: 22,
                          ),
                          onTap: () => Get.back(),
                        )
                      : null,
                  title: Text(
                    "Cart",
                    style: _textStyle.copyWith(
                      fontWeight: FontWeight.normal,
                      color: AppColors.activeDotColor,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
                if (CartItems.items.isEmpty) ...[
                  const SliverFillRemaining(
                    child: Center(
                      child: Text("Your Cart Is empty"),
                    ),
                  ),
                ] else ...[
                  //! Items
                  SliverToBoxAdapter(
                    child: GetBuilder<CartItems>(
                      init: CartItems(),
                      builder: (controller) {
                        return ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: 280.h,
                          ),
                          child: LiveList.options(
                            shrinkWrap: true,
                            itemBuilder: buildAnimatedItem,
                            itemCount: CartItems.items.length,
                            options: options,
                          ),
                        );
                      },
                    ),
                  ),
                  //! divider
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 20,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 1,
                        color: AppColors.gray,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 10.h,
                    ),
                  ),
                  //! Shipping
                  SliverToBoxAdapter(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 180.w,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.local_shipping,
                                      color: AppColors.activeDotColor,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Shipping Cost",
                                          style: _textStyle.copyWith(
                                            color: Colors.black,
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                        Text(
                                          "DHL",
                                          style: _textStyle.copyWith(
                                            color: AppColors.gray,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              "12 \$",
                              style: _textStyle.copyWith(
                                color: AppColors.activeDotColor,
                                fontSize: 15.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 10.h,
                    ),
                  ),
                  //! Total price
                  GetBuilder<CartItems>(
                    init: CartItems(),
                    builder: (context) {
                      return SliverToBoxAdapter(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Price",
                                  style: _textStyle.copyWith(
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                  ),
                                ),
                                Text(
                                  "${(CartItems.getitemPrice() + 12).toStringAsFixed(3)} \$",
                                  style: _textStyle.copyWith(
                                    color: AppColors.activeDotColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  //! Add Address
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Choose Address",
                            style: _textStyle.copyWith(
                              color: AppColors.activeDotColor,
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.gray.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            _address,
                                            style: _textStyle.copyWith(
                                              color: AppColors.white.withOpacity(0.8),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    onTap: () => bottomSheetAdress(
                                      addresschange: (value) {
                                        _address = value;
                                        setState(() {});
                                      },
                                      textStyle: _textStyle,
                                      address: _address,
                                      context: context,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                SizedBox(
                                  width: 150.w,
                                  child: IconButton(
                                    splashColor: Colors.transparent,
                                    onPressed: () => Get.to(() => const AddNewAddress()),
                                    icon: Row(
                                      children: [
                                        Text(
                                          "Add Address",
                                          style: _textStyle.copyWith(
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(width: 2.w),
                                        Icon(
                                          Icons.add,
                                          color: AppColors.activeDotColor,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "Payment Method",
                            style: _textStyle.copyWith(
                              color: AppColors.activeDotColor,
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.gray.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Seected Payment Method",
                                    style: _textStyle.copyWith(
                                      color: AppColors.white.withOpacity(0.8),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () => bottomSheetPayment(
                              textStyle: _textStyle,
                              context: context,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ]
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildAnimatedItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) {
    final TextStyle _textStyle = AppServices.getLangBassedOnAppLang();
    return FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation),
      // And slide transition
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -0.1),
          end: Offset.zero,
        ).animate(animation),
        //!  Widget
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ItemCard(
            textstyle: _textStyle,
            itemprice: _listItems.elementAt(index).itemPrice,
            itemNum: _listItems.elementAt(index).itemNum,
            itemName: _listItems.elementAt(index).itemName,
            itemImage: _listItems.elementAt(index).itemImage,
            index: index,
          ),
        ),
      ),
    );
  }
}
