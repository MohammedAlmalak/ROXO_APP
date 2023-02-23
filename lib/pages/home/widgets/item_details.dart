import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roxo/Components/cart_items.dart';

import '../../../Components/cart_icon.dart';
import '../../../Theme/app_colors.dart';
import '../../../Theme/theme_helper.dart';
import '../../../routes/routes.dart';
import '../components/section_title.dart';
import '../controller/num_of_items_getx_controller.dart';
import 'comment.dart';

class ItmeDetails extends StatefulWidget {
  const ItmeDetails({
    Key? key,
    required TextStyle textsyle,
    required String itemimage,
    required String itemname,
    required double itemprice,
    required double olditemprice,
    required int itemrate,
    required int itemsales,
    required int index,
    required String description,
    required String heroTage,
    required List<String> comments,
    required List<String> commentsname,
    required List<String> commentsdate,
    required List<int> commentsrate,
  })  : _textStyle = textsyle,
        _image = itemimage,
        _itemname = itemname,
        _itemprice = itemprice,
        _itemrate = itemrate,
        //_itemsales = itemsales,
        _olditemprice = olditemprice,
        _index = index,
        _description = description,
        _comments = comments,
        _commentsname = commentsname,
        _commentsdate = commentsdate,
        _commentsrate = commentsrate,
        _heroTage = heroTage,
        super(key: key);
  final TextStyle _textStyle;
  final String _image;
  final String _itemname;
  final double _itemprice;
  final double _olditemprice;
  final int _itemrate;
  //final int _itemsales;
  final int _index;
  final String _description;
  final String _heroTage;
  final List<String> _comments;
  final List<String> _commentsname;
  final List<String> _commentsdate;
  final List<int> _commentsrate;

  @override
  State<ItmeDetails> createState() => _ItmeDetailsState();
}

class _ItmeDetailsState extends State<ItmeDetails> {
  ItemCounter _itemcount = Get.put(ItemCounter());
  CartItems _cartitem = Get.put(CartItems());

  @override
  void dispose() {
    _itemcount.resetitems = 1;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(window.viewPadding);

    Map<String, CartItems> _item = {};
    return SafeArea(
      top: true,
      bottom: false,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            //! Title
            SliverAppBar(
              //! remove back arrow from sliverappbar
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              pinned: false,
              title: Padding(
                padding: EdgeInsets.fromLTRB(0.w, 0.h, 8.w, 0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.activeDotColor,
                        size: 22,
                      ),
                      onTap: () => Get.back(),
                    ),
                    Text(
                      "product Detials",
                      style: widget._textStyle.copyWith(
                        fontWeight: FontWeight.normal,
                        color: AppColors.activeDotColor,
                        fontSize: 16.sp,
                      ),
                    ),
                    CartIcon(
                      onTap: () => Get.toNamed(Routes.cart),
                    ),
                  ],
                ),
              ),
            ),
            //! Image
            SliverToBoxAdapter(
              child: Hero(
                tag: "${widget._itemname}${widget._index}${widget._heroTage}",
                child: Container(
                  height: 200.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget._image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            //! Item details
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 8.0, right: 8.0, bottom: 0),
                child: Column(
                  children: [
                    //! Item Rate and sales
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.activeDotColor,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "(${widget._itemrate})",
                                style: widget._textStyle.copyWith(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                ),
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 18,
                              )
                            ],
                          ),
                        ),
                        //! Sales
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    //! Item name and old\new price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //! Item Name
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget._itemname,
                            style: widget._textStyle.copyWith(
                              color: AppColors.gray,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        //! Item price
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "${widget._olditemprice} \$",
                              style: widget._textStyle.copyWith(
                                decoration: TextDecoration.lineThrough,
                                color: AppColors.gray,
                                fontSize: 14.sp,
                              ),
                            ),
                            Text(
                              "${widget._itemprice} \$",
                              style: widget._textStyle.copyWith(
                                color: AppColors.activeDotColor,
                                fontSize: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    //! Num of elemets
                    GetBuilder<ItemCounter>(
                      //Becuse You Used In Get.Put
                      // init: ItemCounter(),
                      builder: (controller) {
                        return Row(
                          children: [
                            InkWell(
                              child: Icon(
                                Icons.add_circle_outline_outlined,
                                color: AppColors.activeDotColor,
                              ),
                              onTap: () => controller.incremant(),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              controller.items.toString(),
                              style: widget._textStyle.copyWith(
                                color: Colors.black,
                                fontSize: 20.sp,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            InkWell(
                              child: Icon(
                                Icons.remove_circle_outline_outlined,
                                color: AppColors.gray,
                              ),
                              onTap: () => controller.decremnt(),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    //! Description
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Description",
                            style: widget._textStyle.copyWith(
                              color: AppColors.activeDotColor,
                              fontSize: 16.sp,
                            ),
                          ),
                          GetBuilder<Showmore>(
                            init: Showmore(),
                            builder: (controller) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AnimatedSize(
                                    duration: const Duration(milliseconds: 100),
                                    child: ConstrainedBox(
                                      constraints: controller.isExpanded
                                          ? const BoxConstraints()
                                          : const BoxConstraints(
                                              maxHeight: 50.0,
                                            ),
                                      child: Text(
                                        widget._description,
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                        style: widget._textStyle.copyWith(
                                          color: AppColors.gray,
                                          fontWeight: FontWeight.w100,
                                          fontSize: 13.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                  controller.isExpanded
                                      ? ConstrainedBox(
                                          constraints: const BoxConstraints(),
                                        )
                                      : InkWell(
                                          child: Text(
                                            'view more....',
                                            style: widget._textStyle.copyWith(
                                              color: AppColors.activeDotColor,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                          onTap: () => controller.showtext(),
                                        ),
                                ],
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    //! add to cart
                    Container(
                      decoration: ThemeHelper().buttonBoxDecoration(context),
                      child: ElevatedButton(
                        style: ThemeHelper().buttonStyle(raduis: 18),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(80.w, 5.h, 80.w, 5.h),
                          child: Text(
                            'Add to Cart'.toUpperCase(),
                            style: widget._textStyle.copyWith(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onPressed: () {
                          _item[widget._itemname] = CartItems();
                          CartItems.numOfItemPerEachElement += _itemcount.items;
                          _item[widget._itemname]!.itemImage = widget._image;
                          _item[widget._itemname]!.itemName = widget._itemname;
                          _item[widget._itemname]!.itemPrice = widget._itemprice;
                          _item[widget._itemname]!.itemNum = _itemcount.items;
                          CartItems.items.add(_item);
                          _cartitem.update();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    //! Categories Title
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                        left: 15,
                        right: 15,
                        bottom: 0,
                      ),
                      child: SectionTitle(
                        title: "Comments",
                        sectionTitleStyle: widget._textStyle.copyWith(
                          color: AppColors.activeDotColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w100,
                        ),
                        viewAlltsyle: widget._textStyle.copyWith(
                          color: AppColors.gray.withOpacity(0.55),
                          fontSize: 10.sp,
                          fontWeight: FontWeight.normal,
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //! Comments
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Comments(
                    rate: widget._commentsrate.elementAt(index),
                    comment: widget._comments.elementAt(index),
                    date: widget._commentsdate.elementAt(index),
                    textStyle: widget._textStyle,
                    name: widget._commentsname.elementAt(index),
                  );
                },
                childCount: widget._comments.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
