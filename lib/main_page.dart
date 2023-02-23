import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roxo/pages/cart/view/cart.dart';
import 'package:roxo/pages/home/view/home_page.dart';
import 'package:roxo/pages/profile/view/profile.dart';
import 'package:roxo/utils/services.dart';

import 'Theme/app_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final TextStyle _textStyle = AppServices.getLangBassedOnAppLang();
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //! Textstyle
    TextStyle optionStyle = _textStyle.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.bold,
    );
    List<Widget> _widgetOptions = <Widget>[
      HomePage(
        chanepage: (value) => _onItemTapped(value),
      ),
      Text(
        'Index 2: Points',
        style: optionStyle,
      ),
      const Cart(
        iscomingfromitemdetails: false,
      ),
      Profile(
        textStyle: _textStyle,
      )
    ];

    return SafeArea(
      child: Scaffold(
        body: Builder(builder: (context) {
          return Center(child: _widgetOptions.elementAt(_selectedIndex));
        }),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 20.sp,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.stars,
                size: 20.sp,
              ),
              label: 'Points',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 20.sp,
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 20.sp,
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.activeDotColor,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
