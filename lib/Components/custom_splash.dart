library custom_splash;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

enum CustomSplashType { staticDuration, backgroundProcess }

// ignore: must_be_immutable
class CustomSplash extends StatefulWidget {
  CustomSplash({
    Key? key,
    required String imagePath,
    Function? customFunction,
    required String initialRoute,
    required int duration,
    CustomSplashType? type,
    Color? backGroundColor = Colors.white,
    String? animationEffect = 'fade-in',
    required double logoSize,
    Map<dynamic, Widget>? outputAndHome,
  })  : _duration = duration,
        _initialRoute = initialRoute,
        _customFunction = customFunction,
        _imagePath = imagePath,
        _runfor = type,
        _outputAndHome = outputAndHome,
        _backGroundColor = backGroundColor,
        _animationEffect = animationEffect,
        _logoSize = logoSize,
        super(key: key);
  final Map<dynamic, Widget>? _outputAndHome;
  final Function? _customFunction;
  final String _imagePath;
  int _duration;
  final CustomSplashType? _runfor;
  final Color? _backGroundColor;
  final String? _animationEffect;
  final double _logoSize;
  final String _initialRoute;

  @override
  _CustomSplashState createState() => _CustomSplashState();
}

class _CustomSplashState extends State<CustomSplash>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    if (widget._duration < 1000) widget._duration = 2000;
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeInCirc));
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.reset();
  }

  navigator(home) {
    Navigator.of(context).pushReplacement(
        CupertinoPageRoute(builder: (BuildContext context) => home));
  }

  Widget _buildAnimation() {
    switch (widget._animationEffect) {
      case 'fade-in':
        {
          return FadeTransition(
            opacity: _animation,
            child: Center(
              child: SizedBox(
                height: widget._logoSize,
                child: Image.asset(widget._imagePath),
              ),
            ),
          );
        }
      case 'zoom-in':
        {
          return ScaleTransition(
            scale: _animation,
            child: Center(
              child: SizedBox(
                height: widget._logoSize,
                child: Image.asset(widget._imagePath),
              ),
            ),
          );
        }
      case 'zoom-out':
        {
          return ScaleTransition(
            scale: Tween(begin: 1.5, end: 0.6).animate(CurvedAnimation(
                parent: _animationController, curve: Curves.easeInCirc)),
            child: Center(
              child: SizedBox(
                height: widget._logoSize,
                child: Image.asset(widget._imagePath),
              ),
            ),
          );
        }
      case 'top-down':
        {
          return SizeTransition(
            sizeFactor: _animation,
            child: Center(
              child: SizedBox(
                height: widget._logoSize,
                child: Image.asset(widget._imagePath),
              ),
            ),
          );
        }
      default:
        return SizeTransition(
          sizeFactor: _animation,
          child: Center(
            child: SizedBox(
              height: widget._logoSize,
              child: Image.asset(widget._imagePath),
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    widget._runfor == CustomSplashType.backgroundProcess
        ? Future.delayed(Duration.zero).then(
            (value) {
              var res = widget._customFunction!();
              //print("$res+${_outputAndHome[res]}");
              Future.delayed(Duration(milliseconds: widget._duration)).then(
                (value) {
                  Navigator.of(context).pushReplacement(
                    CupertinoPageRoute(
                        builder: (BuildContext context) =>
                            widget._outputAndHome![res]!),
                  );
                },
              );
            },
          )
        : Future.delayed(Duration(milliseconds: widget._duration)).then(
            (value) => Get.offNamed(widget._initialRoute),
          );

    return Scaffold(
      backgroundColor: widget._backGroundColor,
      body: _buildAnimation(),
    );
  }
}
