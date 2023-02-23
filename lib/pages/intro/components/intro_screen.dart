// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroScreen extends StatelessWidget {
  ///This is a builder for an intro screen
  ///
  ///

  /// title of your slide
  ///[String]
  final String? title;

  ///description of your slide
  ///[String]
  final String? description;

  ///image path for your slide
  ///[String]
  final String? imageAsset;

  ///textStyle for your slide
  ///[TextStyle]
  final TextStyle? textStyle;

  ///background color for your slide header
  ///[Color]
  final Color headerBgColor;

  ///padding for the your slide header
  ///[EdgeInsets]
  final EdgeInsets headerPadding;

  ///widget to use as the header part of your screen
  ///[Widget]
  final Widget? header;

  final Color? textColor;

  int? _pageIndex;

  IntroScreen({
    Key? key,
    required String this.title,
    this.headerPadding = const EdgeInsets.all(12),
    required String this.description,
    this.header,
    this.headerBgColor = Colors.black,
    this.textStyle,
    this.imageAsset,
    this.textColor,
  }) : super(key: key);

  set index(val) => _pageIndex = val;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 100,
            ),
            Container(
              height: screenSize.height.h * .50.h,
              padding: headerPadding,
              child: Center(
                child: imageAsset != null
                    ? Image.asset(
                        imageAsset!,
                        fit: BoxFit.fill,
                        width: double.infinity,
                      )
                    : header ??
                        Text(
                          "${_pageIndex ?? 1}",
                          style: TextStyle(
                            fontSize: 300.sp,
                            color: textColor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
