import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roxo/pages/home/widgets/item_card.dart';

import '../../../Theme/app_colors.dart';

class CategoriesDetials extends StatelessWidget {
  const CategoriesDetials({
    Key? key,
    required String backgroundImage,
    required String categorydescrption,
    required String categoryName,
    required List<String> productImages,
    required List<String> itemnaems,
    required List<double> itemprice,
    required List<int> itemrate,
    required TextStyle textsyle,
    required List<int> itemsales,
    required List<int> itemssalespercentge,
    required List<double> olditemprice,
    required List<String> comments,
    required List<String> commentsname,
    required List<int> commentsrate,
    required List<String> commentsdate,
    required List<String> description,
    required String tag,
  })  : _backgroundImage = backgroundImage,
        _categorydescrption = categorydescrption,
        _categoryName = categoryName,
        _productImages = productImages,
        _itemnaems = itemnaems,
        _itemprice = itemprice,
        _itemrate = itemrate,
        _itemsales = itemsales,
        _textsyle = textsyle,
        _comments = comments,
        _itemssalespercentge = itemssalespercentge,
        _olditemprice = olditemprice,
        _commentsname = commentsname,
        _commentsrate = commentsrate,
        _commentsdate = commentsdate,
        _description = description,
        _tag = tag,
        super(key: key);
  final String _backgroundImage;
  final String _categorydescrption;
  final String _categoryName;
  final List<String> _productImages;
  final List<String> _itemnaems;
  final List<double> _itemprice;
  final List<int> _itemrate;
  final List<int> _itemsales;
  final TextStyle _textsyle;
  final List<int> _itemssalespercentge;
  final List<double> _olditemprice;
  final List<String> _comments;
  final List<String> _commentsname;
  final List<int> _commentsrate;
  final List<String> _commentsdate;
  final List<String> _description;
  final String _tag;
  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            //! background image with title
            SliverAppBar(
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back_ios_sharp,
                  color: AppColors.activeDotColor,
                ),
              ),
              expandedHeight: 220.0.h,
              pinned: true,
              floating: false,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                titlePadding: const EdgeInsets.only(bottom: 12),
                title: Text(
                  _categoryName,
                  style: _textsyle.copyWith(
                    color: AppColors.activeDotColor,
                    fontSize: 17.sp,
                  ),
                ),
                background: Hero(
                  tag: "$_categoryName $_tag",
                  child: Image.asset(
                    _backgroundImage,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            //! description
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  _categorydescrption,
                  style: _textsyle.copyWith(
                    color: Colors.black,
                    fontSize: 11.sp,
                    height: 1.5,
                  ),
                ),
              ),
            ),
            //! spacing
            SliverToBoxAdapter(
              child: SizedBox(
                height: 15.h,
              ),
            ),
            //! sliver grid
            LiveSliverGrid(
              itemBuilder: buildAnimatedItem,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.69,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              itemCount: _productImages.length,
              controller: _scrollController,
            ),
            //! bottom padding
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.h,
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
          child: ItemCard(
            textsyle: _textsyle,
            itemimage: _productImages.elementAt(index),
            itemname: _itemnaems.elementAt(index),
            itemrate: _itemrate.elementAt(index),
            itemsales: _itemsales.elementAt(index),
            itemprice: _itemprice.elementAt(index),
            itemssalespercentge: _itemssalespercentge.elementAt(index),
            index: index,
            olditemprice: _olditemprice.elementAt(index),
            comments: _comments,
            commentsname: _commentsname,
            commentsrate: _commentsrate,
            commentsdate: _commentsdate,
            description: _description.elementAt(index),
            heroTage: "CategoriesDetails",
          ),
        ),
      );
}
