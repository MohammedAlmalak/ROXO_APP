import 'dart:math';
import 'package:flutter/material.dart';
import 'intro_screens.dart';

class PageIndicator extends StatelessWidget {
  final int? currentIndex;
  final int? pageCount;
  final Color? activeDotColor;
  final Color? inactiveDotColor;
  final IndicatorType? type;
  final VoidCallback? onTap;

  const PageIndicator({
    Key? key,
    this.currentIndex,
    this.pageCount,
    this.activeDotColor,
    this.onTap,
    this.inactiveDotColor,
    this.type,
  }) : super(key: key);

  _indicator(bool isActive) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: buildIndicatorShape(type, isActive),
      ),
    );
  }

  _buildPageIndicators() {
    List<Widget> indicatorList = [];
    for (int i = 0; i < pageCount!; i++) {
      indicatorList
          .add(i == currentIndex ? _indicator(true) : _indicator(false));
    }
    return indicatorList;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _buildPageIndicators(),
    );
  }

  Widget buildIndicatorShape(type, isActive) {
    double scaleFactor = isActive ? 1.4 : 1.0;
    double angle = type == IndicatorType.DIAMOND ? pi / 4 : 0.0;
    return Transform.scale(
      scale: scaleFactor,
      child: Transform.rotate(
        angle: angle,
//      angle: type == IndicatorType.DIAMOND ? pi / 4 : 0.0,
        child: AnimatedContainer(
          height: type == IndicatorType.CIRCLE || type == IndicatorType.DIAMOND
              ? 8.0
              : 4.8,
          width: type == IndicatorType.CIRCLE || type == IndicatorType.DIAMOND
              ? 8.0
              : 24.0,
          duration: const Duration(milliseconds: 300),
          decoration: decoration(isActive, type),
        ),
      ),
    );
  }

  BoxDecoration decoration(bool isActive, type) {
    return BoxDecoration(
      shape:
          type == IndicatorType.CIRCLE ? BoxShape.circle : BoxShape.rectangle,
      color: isActive ? activeDotColor : inactiveDotColor,
      borderRadius:
          type == IndicatorType.CIRCLE || type == IndicatorType.DIAMOND
              ? null
              : BorderRadius.circular(50),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(
            .02,
          ),
          offset: const Offset(0.0, 2.0),
          blurRadius: 2.0,
        )
      ],
    );
  }
}