import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:roxo/Theme/app_colors.dart';
import 'package:roxo/utils/services.dart';

import '../components/categories_detalis.dart';

class ViewAllCategories extends StatelessWidget {
  const ViewAllCategories({
    required TextStyle textStyle,
    required List<String> images,
    required List<String> titles,
    required List<String> productImages,
    required List<String> itemnaems,
    required List<double> itemprice,
    required List<int> itemrate,
    required List<int> itemsales,
    required List<String> categorydescrption,
    required List<int> itemssalespercentge,
    required List<double> olditemprice,
    required List<String> comments,
    required List<String> commentsname,
    required List<int> commentsrate,
    required List<String> commentsdate,
    required List<String> description,
    Key? key,
  })  : _textStyle = textStyle,
        _images = images,
        _titles = titles,
        _productImages = productImages,
        _itemnaems = itemnaems,
        _itemprice = itemprice,
        _itemrate = itemrate,
        _itemsales = itemsales,
        _categorydescrption = categorydescrption,
        _itemssalespercentge = itemssalespercentge,
        _olditemprice = olditemprice,
        _commentsname = commentsname,
        _commentsrate = commentsrate,
        _commentsdate = commentsdate,
        _description = description,
        _comments = comments,
        super(key: key);
  final TextStyle _textStyle;
  final List<String> _images;
  final List<String> _titles;
  final List<String> _productImages;
  final List<String> _itemnaems;
  final List<double> _itemprice;
  final List<int> _itemrate;
  final List<int> _itemsales;
  final List<String> _categorydescrption;
  final List<int> _itemssalespercentge;
  final List<double> _olditemprice;
  final List<String> _comments;
  final List<String> _commentsname;
  final List<int> _commentsrate;
  final List<String> _commentsdate;
  final List<String> _description;
  @override
  Widget build(BuildContext context) {
    final TextStyle _textStyle = AppServices.getLangBassedOnAppLang();
    final _scrollController = ScrollController();
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              //! remove back arrow from sliverappbar
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              pinned: false,
              centerTitle: true,
              leading: InkWell(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.activeDotColor,
                  size: 22,
                ),
                onTap: () => Get.back(),
              ),
              title: Text(
                "Categories",
                style: _textStyle.copyWith(
                  fontWeight: FontWeight.normal,
                  color: AppColors.activeDotColor,
                  fontSize: 16.sp,
                ),
              ),
            ),
            //! Lists
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              sliver: LiveSliverList(
                controller: _scrollController,
                showItemInterval: const Duration(milliseconds: 100),
                showItemDuration: const Duration(milliseconds: 150),
                itemCount: _images.length,
                itemBuilder: buildAnimatedItem,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildAnimatedItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) =>
      //! For example wrap with fade transition
      FadeTransition(
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
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                elevation: 8,
                child: Hero(
                  tag: "${_titles.elementAt(index)} ViewAllCategories",
                  child: Container(
                    width: 120.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.7),
                          BlendMode.dstOver,
                        ),
                        image: AssetImage(_images.elementAt(index)),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        _titles.elementAt(index),
                        style: _textStyle.copyWith(
                          color: AppColors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            onTap: () => Get.to(
              () => CategoriesDetials(
                itemnaems: _itemnaems,
                backgroundImage: _images.elementAt(index),
                itemrate: _itemrate,
                categorydescrption: _categorydescrption.elementAt(index),
                productImages: _productImages,
                itemprice: _itemprice,
                categoryName: _titles.elementAt(index),
                itemsales: _itemsales,
                textsyle: _textStyle,
                description: _description,
                commentsrate: _commentsrate,
                commentsname: _commentsname,
                itemssalespercentge: _itemssalespercentge,
                commentsdate: _commentsdate,
                comments: _comments,
                olditemprice: _olditemprice,
                tag: "ViewAllCategories",
              ),
            ),
          ),
        ),
      );
}
