import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roxo/Theme/app_colors.dart';
import 'package:roxo/pages/view_all_categories/components/categories_detalis.dart';

class Categories extends StatefulWidget {
  const Categories({
    Key? key,
    required this.categoryStyle,
    required this.title,
    required this.image,
    required this.categorydescrption,
    required this.comments,
    required this.commentsdate,
    required this.commentsname,
    required this.commentsrate,
    required this.description,
    required this.itemnaems,
    required this.itemprice,
    required this.itemrate,
    required this.itemsales,
    required this.itemssalespercentge,
    required this.olditemprice,
    required this.productImages,
    required this.textsyle,
  }) : super(key: key);
  final TextStyle categoryStyle;
  final String title;
  final String image;
  final String categorydescrption;
  final List<String> productImages;
  final List<String> itemnaems;
  final List<double> itemprice;
  final List<int> itemrate;
  final TextStyle textsyle;
  final List<int> itemsales;
  final List<int> itemssalespercentge;
  final List<double> olditemprice;
  final List<String> comments;
  final List<String> commentsname;
  final List<int> commentsrate;
  final List<String> commentsdate;
  final List<String> description;
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.activeDotColor.withOpacity(0.7),
      borderRadius: BorderRadius.circular(9),
      child: InkWell(
        child: Hero(
          tag: "${widget.title} Categories",
          child: Container(
            width: 120.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.7),
                  BlendMode.dstOver,
                ),
                image: AssetImage(widget.image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Center(
              child: Text(widget.title, style: widget.categoryStyle),
            ),
          ),
        ),
        onTap: () => Get.to(
          () => CategoriesDetials(
            backgroundImage: widget.image,
            categoryName: widget.title,
            itemsales: widget.itemsales,
            itemprice: widget.itemprice,
            commentsname: widget.commentsname,
            commentsdate: widget.commentsdate,
            comments: widget.comments,
            textsyle: widget.textsyle,
            olditemprice: widget.olditemprice,
            productImages: widget.productImages,
            description: widget.description,
            itemnaems: widget.itemnaems,
            itemssalespercentge: widget.itemssalespercentge,
            commentsrate: widget.commentsrate,
            itemrate: widget.itemrate,
            categorydescrption: widget.categorydescrption,
            tag: "Categories",
          ),
        ),
      ),
    );
  }
}
//! give the red Effects
// ShaderMask(
//         shaderCallback: (rect) {
//           return const LinearGradient(
//             begin: Alignment.center,
//             end: Alignment.bottomCenter,
//             colors: [
//               Colors.black,
//               Colors.transparent,
//             ],
//           ).createShader(Rect.fromLTRB(0, 10, rect.width, rect.height));
//         },
//         blendMode: BlendMode.dstIn,