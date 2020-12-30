import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/Component/Color/color.dart';
import 'package:norwayfinalcustomer/Component/Style/style.dart';
import 'package:norwayfinalcustomer/car/pages/OrdersTab.dart';
import 'package:norwayfinalcustomer/car/pages/carooption.dart';

class CarNavigation extends StatefulWidget {
  @override
  _CarNavigationState createState() => _CarNavigationState();
}

class _CarNavigationState extends State<CarNavigation> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    CarOption(),
    OrderTab(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      if (_currentIndex == index) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme:
              IconThemeData(opacity: 5, color: AppColors.blueColor),
          selectedItemColor: AppColors.blueColor,
          // fixedColor: Colors.black,

          unselectedItemColor: Colors.black,
          unselectedIconTheme: IconThemeData(opacity: 5, color: Colors.black),
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Container(
                  width: 25, height: 25, child: Icon(Icons.shopping_cart)),
              title: Text(
                'Booking',
                style: AppFonts.monm,
              ),
            ),
            BottomNavigationBarItem(
              icon: Container(
                  width: 25, height: 25, child: Icon(Icons.shopping_cart)),
              title: Text(
                'Order',
                style: AppFonts.monm,
              ),
            ),
          ],
          currentIndex: _currentIndex,

          onTap: onTabTapped,
        ));
  }
}
