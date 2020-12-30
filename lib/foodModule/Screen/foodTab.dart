import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/Component/Color/color.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/Component/Style/style.dart';

import 'foodNewOrder/foodNewOrderList.dart';
import 'foodPastOrders/foodPastOrdersList.dart';

class FoodTab extends StatefulWidget {
  @override
  _FoodTabState createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  List<Widget> containers = [
    Container(
      child: foodNewOrderList(),
    ),
    Container(
      child: foodPastOrdersList(),
    ),
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
              indicatorColor: Colors.green[500],
              labelPadding: EdgeInsets.symmetric(horizontal: 40.0),
              labelColor: Colors.green[500],
              unselectedLabelColor: Colors.grey[400],
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    'Order In Process',
                    style: AppFonts.monmbold,
                  ),
                ),
                Tab(
                  child: Text(
                    'PAST ORDERS',
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
