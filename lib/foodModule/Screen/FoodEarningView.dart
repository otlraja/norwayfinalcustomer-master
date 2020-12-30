import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/foodModule/MOdel/Food_Earning/FoodEarning_List.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/Component/Style/style.dart';


// import 'package:norway_service/model/Grocery_Earning/FoodEarning_List.dart';

class FoodEarningView extends StatefulWidget {
  @override
  _FoodEarningViewState createState() => _FoodEarningViewState();
}

class _FoodEarningViewState extends State<FoodEarningView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        // height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height / 5.28,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          child: IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Container(
                          child: Text('Earning', style: AppFonts.monmbold20),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 150, 0),
                      child: Container(
                        height: 20,
                        child: Text(
                          'AVAILABLE BALANCE',
                          style: AppFonts.monmgrey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
                      child: Container(
                        height: 30,
                        child: Row(
                          children: <Widget>[
                            Text(
                              '\$',
                              style: AppFonts.monmyellowbold30,
                            ),
                            Text(
                              '758.50',
                              style: AppFonts.monmyellowbold30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            Container(
                color: Colors.grey[200],
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 300,
                        child: Text('RECENT', style: AppFonts.monmgreybold12),
                      ),
                    ),
                    FoodEarning_List(),
                  ],
                )),
          ],
        ),
      )),
    );
  }
}
