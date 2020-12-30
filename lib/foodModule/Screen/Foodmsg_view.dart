import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/foodModule/MOdel/FoodmsgCards/foodmsg_List.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/Component/Style/style.dart';


class Foodmsgview extends StatefulWidget {
  @override
  _FoodmsgviewState createState() => _FoodmsgviewState();
}

class _FoodmsgviewState extends State<Foodmsgview> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
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
                    Padding(
                      padding: const EdgeInsets.only(left: 80),
                      child: Container(
                        child: Text(
                          'Messages',
                          style: AppFonts.monmbold1,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(height: MediaQuery.of(context).size.height*0.9, child: FoodMsg_List())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
