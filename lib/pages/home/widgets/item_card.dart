import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roxo/pages/home/widgets/item_details.dart';

import '../../../Theme/app_colors.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required TextStyle textsyle,
    required String itemimage,
    required String itemname,
    required double itemprice,
    required double olditemprice,
    required int itemrate,
    required int itemsales,
    required int itemssalespercentge,
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
        _itemsales = itemsales,
        _olditemprice = olditemprice,
        _itemssalespercentge = itemssalespercentge,
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
  final int _itemsales;
  final int _itemssalespercentge;
  final int _index;
  final String _description;
  final String _heroTage;
  final List<String> _comments;
  final List<String> _commentsname;
  final List<String> _commentsdate;
  final List<int> _commentsrate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: InkWell(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          elevation: 2,
          child: SizedBox(
            width: 138.w,
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Stack(
                    children: [
                      //! Image
                      Hero(
                        tag: "$_itemname$_index$_heroTage",
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(10.0.r),
                            ),
                            image: DecorationImage(
                              image: AssetImage(
                                _image,
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      //! Sales
                      Positioned(
                        child: Container(
                          width: 45.w,
                          height: 17.h,
                          decoration: BoxDecoration(
                            color: AppColors.activeDotColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0.r),
                              bottomRight: Radius.circular(10.0.r),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "$_itemssalespercentge %",
                              style: _textStyle.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                    //! Item Name
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _itemname,
                            style: _textStyle.copyWith(
                              color: AppColors.gray,
                              fontSize: 11.5.sp,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "$_itemprice \$",
                                  style: _textStyle.copyWith(
                                    color: AppColors.activeDotColor,
                                    fontSize: 12.5.sp,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "($_itemrate) ⭐",
                                        style: _textStyle.copyWith(
                                          color: AppColors.gray,
                                          fontSize: 11.5.sp,
                                        ),
                                      ),
                                      Text(
                                        "$_itemsales Sale",
                                        style: _textStyle.copyWith(
                                          color: AppColors.gray,
                                          fontSize: 11.5.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        onTap: () => Get.to(
          () => ItmeDetails(
            textsyle: _textStyle,
            itemimage: _image,
            itemname: _itemname,
            itemrate: _itemrate,
            itemprice: _itemprice,
            itemsales: _itemsales,
            index: _index,
            olditemprice: _olditemprice,
            description: _description,
            heroTage: _heroTage,
            comments: _comments,
            commentsdate: _commentsdate,
            commentsname: _commentsname,
            commentsrate: _commentsrate,
          ),
        ),
      ),
    );
  }
}
