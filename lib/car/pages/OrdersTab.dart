import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/Component/Color/color.dart';
import 'package:norwayfinalcustomer/Component/Style/style.dart';
import 'package:norwayfinalcustomer/car/pages/Past_Oders.dart';
import 'package:norwayfinalcustomer/car/pages/on_goin_Orders.dart';

class OrderTab extends StatefulWidget {
  @override
  _OrderTabState createState() => _OrderTabState();
}

class _OrderTabState extends State<OrderTab> {
  List<Widget> containers = [
  Container(
  child:On_Going_Order(),
  ),
  Container(child: Past_Order()),
];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            title: Center(
              child: Text(
                'My Orders',
                style: AppFonts.monmbold1,
              ),
            ),
            backgroundColor: Colors.white,
            bottom: TabBar(
              indicatorPadding: EdgeInsets.symmetric(horizontal: 70),
              indicatorColor: AppColors.yellowColor,
              labelPadding: EdgeInsets.symmetric(horizontal: 40.0),
              labelColor: AppColors.yellowColor,
              unselectedLabelColor: Colors.grey[400],
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    'On Going Orders',
                    style: AppFonts.monmbold,
                  ),
                ),
                Tab(
                  child: Text(
                    'Past Orders',
                    style: AppFonts.monmbold,
                  ),
                ),

              ],
            ),
          ),
          body: TabBarView(children: containers),
        ),
      ),
    );
  }
}
