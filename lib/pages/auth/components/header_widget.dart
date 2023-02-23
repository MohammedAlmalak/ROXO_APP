// This widget will draw header section of all page. Wich you will get with the project source code.

import 'package:flutter/material.dart';

import '../../../Theme/app_colors.dart';

class HeaderWidget extends StatefulWidget {
  final double _height;
  final bool _showIcon;
  final IconData? _icon;
  final String _title;
  final TextStyle _textStyle;
  const HeaderWidget({
    Key? key,
    required double height,
    required bool showIcon,
    required String title,
    required TextStyle textStyle,
    IconData? icon,
  })  : _height = height,
        _showIcon = showIcon,
        _icon = icon,
        _title = title,
        _textStyle = textStyle,
        super(key: key);

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        ClipPath(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.activeDotColor.withOpacity(0.4),
                  AppColors.activeDotColor.withOpacity(0.4),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: const [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          clipper: ShapeClipper([Offset(width / 5, widget._height), Offset(width / 10 * 6, widget._height - 60), Offset(width / 5 * 4, widget._height + 20), Offset(width + 80, widget._height - 18)]),
        ),
        ClipPath(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    AppColors.activeDotColor.withOpacity(0.4),
                    AppColors.activeDotColor.withOpacity(0.4),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: const [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
          clipper: ShapeClipper(
            [
              Offset(width / 3, widget._height + 20),
              Offset(width / 10 * 7, widget._height - 60),
              Offset(width - 200, widget._height - 60),
              Offset(width - 200, widget._height - 60),
            ],
          ),
        ),
        ClipPath(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    AppColors.activeDotColor,
                    AppColors.activeDotColor,
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: const [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
          clipper: ShapeClipper([Offset(width / 5, widget._height), Offset(width / 2, widget._height - 40), Offset(width / 5 * 4, widget._height - 80), Offset(width + 80, widget._height - 20)]),
        ),
        Visibility(
          visible: widget._showIcon,
          child: SizedBox(
            height: widget._height - 40,
            child: Center(
              child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.only(
                  left: 5.0,
                  top: 20.0,
                  right: 5.0,
                  bottom: 20.0,
                ),
                decoration: const BoxDecoration(
                  // borderRadius: BorderRadius.circular(20),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                ),
                child: widget._icon == null
                    ? Text(
                        widget._title,
                        style: widget._textStyle,
                      )
                    : Icon(
                        widget._icon,
                        color: Colors.white,
                        size: 40,
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ShapeClipper extends CustomClipper<Path> {
  final List<Offset> _offsets;
  ShapeClipper(this._offsets);
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height - 20);

    // path.quadraticBezierTo(size.width/5, size.height, size.width/2, size.height-40);
    // path.quadraticBezierTo(size.width/5*4, size.height-80, size.width, size.height-20);

    path.quadraticBezierTo(_offsets[0].dx, _offsets[0].dy, _offsets[1].dx, _offsets[1].dy);
    path.quadraticBezierTo(_offsets[2].dx, _offsets[2].dy, _offsets[3].dx, _offsets[3].dy);

    // path.lineTo(size.width, size.height-20);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
