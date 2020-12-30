import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/foodModule/Screen/Food_Profile.dart';
import 'package:norwayfinalcustomer/foodModule/Screen/foodTab.dart';
import 'package:norwayfinalcustomer/foodReservation/components/Home.dart';
class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int index=0;
  int _currentIndex = 0;
  final List<Widget> _children = [
    Home(),
    FoodTab(), //Grocery Orde
    // rs
    // Grocery earning
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

        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          showElevation: false,
          itemCornerRadius: 18,
          curve: Curves.easeInBack,
          onItemSelected: (index) => setState(() {
            _currentIndex = index;
          }),
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home',style: TextStyle(color: Colors.grey[500]),),
              activeColor: Colors.green[500],
              inactiveColor: Colors.black,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.shopping_basket),
              title: Text('Order',style: TextStyle(color: Colors.grey[500])),
              activeColor: Colors.green[500],
              inactiveColor: Colors.black,
              textAlign: TextAlign.center,
            ),

          ],
        ),
        body: _children[_currentIndex]
    );
  }
}
