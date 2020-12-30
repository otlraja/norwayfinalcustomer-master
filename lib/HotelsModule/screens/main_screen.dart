

import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/HotelsModule/widgets/icon_badge.dart';
import 'dart:math' as math;


import 'home.dart';



class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;
  int _page = 0;
  var paddingLeft = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              //DrawerMenu(),
              Padding(
                padding: EdgeInsets.only(left: 0),
                child:PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: onPageChanged,
                  children: List.generate(4, (index) => Home()),
                ),
              ),
            ],
          ),

        ));
  }

  Widget _buildMenu(var x, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          paddingLeft = index * MediaQuery.of(context).size.width / 3.5;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        // color: Colors.pink,
        //padding: EdgeInsets.only(top: 0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Transform.rotate(
              angle: math.pi / 2,
              child: Container(
                // width: 120,
                height: 30,
//            color: Colors.pink,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/${x}"),
                      //fit: BoxFit.cover,
                    )),
                //child:Icon(x,color: Colors.white,),
//            Text(
//              menu,
//              style: TextStyle(
//                fontSize: 18,
//              ),
//            ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  Widget barIcon(
      {IconData icon = Icons.home, int page = 0, bool badge = false}) {
    return IconButton(
      icon: badge ? IconBadge(icon: icon, size: 24.0) : Icon(icon, size: 24.0),
      color:
          _page == page ? Theme.of(context).accentColor : Colors.blueGrey[300],
      onPressed: () => _pageController.jumpToPage(page),
    );
  }
}
