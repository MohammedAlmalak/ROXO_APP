// ignore_for_file: constant_identifier_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roxo/utils/services.dart';
import 'intro_screen.dart';
import 'package:get/get.dart';

import 'page_indicatore.dart';

enum IndicatorType { CIRCLE, LINE, DIAMOND }

enum FooterShape { NORMAL, CURVED_TOP, CURVED_BOTTOM }

class IntroScreens extends StatefulWidget {
//  PageController get controller => this.createState()._controller;

  @override
  _IntroScreensState createState() => _IntroScreensState();

  ///sets the indicator type for your slides
  ///[IndicatorType]
  final IndicatorType? indicatorType;

  ///sets the next widget, the one used to move to the next screen
  ///[Widget]
  final Widget? nextWidget;

  ///sets the done widget, the one used to end the slides
  ///[Widget]
  final Widget? doneWidget;

  final String appTitle;

  ///set the radius of the footer part of your slides
  ///[double]
  final double footerRadius;

  ///sets the viewport fraction of your controller
  ///[double]
  final double viewPortFraction;

  ///sets your slides
  ///[List<IntroScreen>]
  final List<IntroScreen> slides;

  ///sets the skip widget text
  ///[String]
  final String skipText;

  ///defines what to do when the skip button is tapped
  ///[Function]
  final Function onSkip;

  ///defines what to do when the last slide is reached
  ///[Function]
  final Function onDone;

  /// set the color of the active indicator
  ///[Color]
  final Color activeDotColor;

  ///set the color of an inactive indicator
  ///[Color]
  final Color? inactiveDotColor;

  ///sets the padding of the footer part of your slides
  ///[EdgeInsets]
  final EdgeInsets footerPadding;

  ///sets the background color of the footer part of your slides
  ///[Color]
  final Color footerBgColor;

  ///sets the text color of your slides
  ///[Color]
  final Color textColor;

  ///sets the colors of the gradient for the footer widget of your slides
  ///[List<Color>]
  final List<Color> footerGradients;

  ///[ScrollPhysics]
  ///sets the physics for the page view
  final ScrollPhysics physics;

  final Color? skipColor;

  const IntroScreens({
    Key? key,
    required this.slides,
    this.footerRadius = 12.0,
    this.footerGradients = const [],
    required this.onDone,
    this.indicatorType = IndicatorType.CIRCLE,
    this.appTitle = '',
    this.physics = const BouncingScrollPhysics(),
    required this.onSkip,
    this.nextWidget,
    this.doneWidget,
    this.activeDotColor = Colors.white,
    this.inactiveDotColor,
    this.skipText = 'skip',
    this.viewPortFraction = 1.0,
    this.textColor = Colors.white,
    this.footerPadding = const EdgeInsets.all(24),
    this.skipColor,
    this.footerBgColor = const Color(0xff51adf6),
  }) : assert(slides.length > 0);
}

class _IntroScreensState extends State<IntroScreens> with TickerProviderStateMixin {
  final TextStyle _textStyle = AppServices.getLangBassedOnAppLang();
  PageController? _controller;
  double? pageOffset = 0;
  int currentPage = 0;
  bool lastPage = false;
  late AnimationController animationController;
  IntroScreen? currentScreen;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: currentPage,
      viewportFraction: widget.viewPortFraction,
    )..addListener(() {
        pageOffset = _controller!.page;
      });

    currentScreen = widget.slides[0];
    animationController = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
  }

  TextStyle get textStyle =>
      currentScreen!.textStyle ??
      _textStyle.copyWith(
        fontSize: 14.sp,
        color: widget.skipColor ?? Colors.white,
        fontWeight: FontWeight.w400,
      );

  Widget get next =>
      widget.nextWidget ??
      Icon(
        Icons.arrow_forward,
        size: 24.sp,
        color: widget.textColor,
      );

  Widget get done =>
      widget.doneWidget ??
      Icon(
        Icons.check,
        size: 24.sp,
        color: widget.textColor,
      );

  @override
  void dispose() {
    _controller!.dispose();
    animationController.dispose();
    super.dispose();
  }

  bool get existGradientColors => widget.footerGradients.isNotEmpty;

  LinearGradient get gradients => existGradientColors
      ? LinearGradient(colors: widget.footerGradients, begin: Alignment.topLeft, end: Alignment.topRight)
      : LinearGradient(
          colors: [
            widget.footerBgColor,
            widget.footerBgColor,
          ],
        );

  int getCurrentPage() {
    return _controller!.page!.floor();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: currentScreen?.headerBgColor.withOpacity(.8) ?? Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: currentScreen?.headerBgColor ?? Colors.transparent,
      ),
      child: Container(
        color: Colors.white,
//        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Stack(
          clipBehavior: Clip.none,
          // overflow: Overflow.visible,
          fit: StackFit.expand,
          children: <Widget>[
            PageView.builder(
              itemCount: widget.slides.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                  currentScreen = widget.slides[currentPage];
                  setState(() {
                    currentScreen!.index = currentPage + 1;
                  });
                  if (currentPage == widget.slides.length - 1) {
                    lastPage = true;
                    animationController.forward();
                  } else {
                    lastPage = false;
                    animationController.reverse();
                  }
                });
              },
              controller: _controller,
              physics: widget.physics,
              itemBuilder: (context, index) {
                if (index == pageOffset!.floor()) {
                  return AnimatedBuilder(
                      animation: _controller!,
                      builder: (context, _) {
                        return buildPage(
                          index: index,
                          angle: pageOffset! - index,
                        );
                      });
                } else if (index == pageOffset!.floor() + 1) {
                  return AnimatedBuilder(
                    animation: _controller!,
                    builder: (context, _) {
                      return buildPage(
                        index: index,
                        angle: pageOffset! - index,
                      );
                    },
                  );
                }
                return buildPage(index: index);
              },
            ),
            //! logo
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  "assets/images/logo/ROXN_Logo_red.png",
                  width: 70.w,
                  height: 50.h,
                ),
              ),
            ),
            //! footer widget
            Positioned(
              bottom: 40.h,
              left: 0,
              right: 0,
              child: Container(
                padding: widget.footerPadding,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(widget.footerRadius.toDouble()),
                    topLeft: Radius.circular(widget.footerRadius.toDouble()),
                  ),
                  color: widget.footerBgColor,
                  gradient: gradients,
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20.h,
                        ),
                        //! Title
                        Text(
                          // currentScreen!.title!,
                          'search'.tr,
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: _textStyle.copyWith(
                            color: widget.textColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 25,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        //! description
                        Text(
                          currentScreen!.description!,
                          softWrap: true,
                          style: _textStyle.copyWith(
                            color: widget.textColor,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //controls widget
            Positioned(
              left: 0,
              right: 0,
              bottom: 10,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 0.h),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IgnorePointer(
                        ignoring: lastPage,
                        child: Opacity(
                          opacity: lastPage ? 0.0 : 1.0,
                          child: Material(
                            type: MaterialType.transparency,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(100),
                              child: Text(
                                widget.skipText.toUpperCase(),
                                style: textStyle,
                              ),
                              onTap: widget.onSkip as void Function()?,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 160.w,
                          child: PageIndicator(
                            type: widget.indicatorType,
                            currentIndex: currentPage,
                            activeDotColor: widget.activeDotColor,
                            inactiveDotColor: widget.inactiveDotColor ?? widget.activeDotColor.withOpacity(.5),
                            pageCount: widget.slides.length,
                            onTap: () {
                              _controller!.animateTo(
                                _controller!.page!,
                                duration: const Duration(
                                  milliseconds: 400,
                                ),
                                curve: Curves.fastOutSlowIn,
                              );
                            },
                          ),
                        ),
                      ),
                      Material(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        type: MaterialType.transparency,
                        child: lastPage
                            ? InkWell(
                                borderRadius: BorderRadius.circular(100.r),
                                onTap: widget.onDone as void Function()?,
                                child: done,
                              )
                            : InkWell(
                                borderRadius: BorderRadius.circular(100.r),
                                child: next,
                                onTap: () => _controller!.nextPage(duration: const Duration(milliseconds: 800), curve: Curves.fastOutSlowIn),
                              ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            //app title
            /*Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  widget.appTitle,
                  style: textStyle.apply(
                      fontSizeDelta: 12, fontWeightDelta: 8, color: Colors.red),
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }

  Widget buildPage({required int index, double angle = 0.0, double scale = 1.0}) {
    // print(pageOffset - index);
    return Container(
      color: Colors.transparent,
      child: Transform(
        child: widget.slides[index],
        transform: Matrix4.identity()
          ..setEntry(3, 2, .001)
          ..rotateY(angle),
      ),
    );
  }
}
