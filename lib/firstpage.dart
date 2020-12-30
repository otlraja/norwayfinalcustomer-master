
import 'dart:ui';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:norwayfinalcustomer/Wallet.dart';
import 'package:norwayfinalcustomer/car/Bottom%20Navigation.dart';
import 'package:norwayfinalcustomer/foodModule/Screen/foodcategory.dart';

import 'API/API.dart';
import 'CreditCard.dart';
import 'FlightModule/screens/welcome.dart';
import 'HotelsModule/screens/main_screen.dart';
import 'Saloon/pages/SelectSaloon.dart';
import 'foodModule/SelectType.dart';
import 'global.dart';

class Firstpage extends StatefulWidget {
  @override
  _FirstpageState createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  // List<FoodModel> foodList = FoodModel.list;
  PageController pageController = PageController(viewportFraction: .8);
  var paddingLeft = 0.0;
  bool NotificationisSwitched = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  String notiEnable = 'Disable';
  var indicatorvisible = false;
  var i = 0;

  var clickstatus=true;

  waittofetchvendors(var typee) async {
    if (i == 0) {
      setState(() {
        indicatorvisible = true;
        //indicator();
      });
    }
    await Future.delayed(const Duration(seconds: 1), () {
      if (API.success == 'true') {
        setState(() {
          indicatorvisible = false;
        });
        i = 0;
        type = typee;
        if (usertoken != null && type == 'grocery') {
          API.orderinprogessfood(groceryinprogress + userid, type);
        }

        if (usertoken != null && type == 'store') {
          API.orderinprogessfood(storeinprogress + userid, type);
        }
        clickstatus=true;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CategoryFood()));
      } else {
        waittofetchvendors(typee);
      }
    });
  }

  @override
  void initState() {
    if(usertoken != null){

      callAPI();
    }
    super.initState();
  }

  callAPI()async{
    await Future.delayed(Duration(seconds: 2), (){
      if(result != null && result){
        API.getuseloc(getuserlocAPI+userid.toString());
      }
      else{
        internettoast();
      }
    });
  }




  Widget _getFAB() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22),
      backgroundColor: Color(0xFFFF8967),
      visible: true,
      curve: Curves.bounceIn,
      children: [
        // FAB 1
        SpeedDialChild(
            child: Icon(Icons.credit_card),
            backgroundColor: Color(0xFFFF8967),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MasterCard()));
            },
            label: 'Credit Card',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: Color(0xFFFF8967)),
        SpeedDialChild(
            child: Icon(Icons.settings),
            backgroundColor: Color(0xFFFF8967),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MasterCard()));
            },
            label: 'Settings',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: Color(0xFFFF8967)),
        // FAB 2
        SpeedDialChild(
            child: Icon(Icons.history),
            backgroundColor: Color(0xFFFF8967),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HScreen()));
            },
            label: 'Payment History',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: Color(0xFFFF8967))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _getFAB(),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: _buildRightSection(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: indicatorshow(indicatorvisible),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRightSection() {
    return Padding(
      padding: EdgeInsets.only(top: 0, bottom: 5),
      child: Container(
          color: Colors.white,
          child: Container(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            height: 190,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Color(0xFFFDF0E2),
                            ),
                            child: InkWell(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.5,
                                              //alignment: Alignment.bottomLeft,
                                              child: Text('  Food',
                                                  style:
                                                      TextStyle(fontSize: 30))),
                                        ],
                                      ),
                                    ),
                                    Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          "   Ready To Eat",
                                          style: TextStyle(
                                              color: Color(0xFFFF8967),
                                              fontSize: 20),
                                        )),
                                    Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                            "    Delivery within 15 mins",
                                            style: TextStyle(fontSize: 15))),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 12, top: 20),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: MaterialButton(
                                          onPressed: () {
                                            if(clickstatus)
                                              {
                                                clickstatus=false;
                                                checkconnection();
                                                if(result != null && result){
                                                  type = "food";
                                                  if (usertoken != null && type == 'food') {
                                                    API.orderinprogessfood(
                                                        foodinprogress + userid, type);
                                                  }
                                                  clickstatus=true;
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => SelectType()));

                                                }
                                                else{
                                                  internettoast();
                                                }
                                              }


                                          },
                                          color: Color(0xFFFF8967),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Text(
                                            'Book Now',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {


                                  if(clickstatus)
                                  {

                                    checkconnection();
                                    if(result != null && result){
                                      clickstatus=false;
                                      type = "food";
                                      if (usertoken != null && type == 'food') {
                                        API.orderinprogessfood(
                                            foodinprogress + userid, type);
                                      }
                                      clickstatus=true;
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SelectType()));

                                    }
                                    else{
                                      internettoast();
                                    }
                                  }
                                }),
                          ),
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 60.0,
                        ),
                        child: Container(
                          child: Image(
                            height: 200,
                            width: 200,
                            image: AssetImage("assets/Image 4@3x.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          height: 190,
                          width: MediaQuery.of(context).size.width / 1.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Color(0xFFFDF0E2),
                          ),
                          child: InkWell(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.7,
                                            //alignment: Alignment.bottomLeft,
                                            child: Text('  Grocery',
                                                style:
                                                    TextStyle(fontSize: 30))),
                                      ],
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        "   Fresh Grocery",
                                        style: TextStyle(
                                            color: Color(0xFFFF8967),
                                            fontSize: 20),
                                      )),
                                  Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text("    Shop Now",
                                          style: TextStyle(fontSize: 15))),
                                  Padding(
                                    padding: EdgeInsets.only(left: 12, top: 20),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: MaterialButton(
                                        onPressed: () {

                                          if(clickstatus)
                                            {


                                              checkconnection();
                                              Future.delayed(Duration(seconds: 1));
                                              if(result != null && result){
                                                clickstatus=false;
                                                API.allfoodvendors(GroceryvendorAPI);
                                                waittofetchvendors('grocery');
                                              }
                                              else{
                                                internettoast();
                                              }
                                            }



                                        },
                                        color: Color(0xFFFF8967),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Text(
                                          'Book Now',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                if(clickstatus)
                                {


                                  checkconnection();
                                  Future.delayed(Duration(seconds: 1));
                                  if(result != null && result){
                                    clickstatus=false;
                                    API.allfoodvendors(GroceryvendorAPI);
                                    waittofetchvendors('grocery');
                                  }
                                  else{
                                    internettoast();
                                  }
                                }
                              }),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 80.0, left: 200),
                    child: Container(
                      child: Image(
                        height: 150,
                        width: 150,
                        image: AssetImage(
                          'assets/grocerys.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ]),
                Stack(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            height: 190,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Color(0xFFFDF0E2),
                            ),
                            child: InkWell(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            child: Text('  Book Ride',
                                                style:
                                                    TextStyle(fontSize: 30))),
                                      ],
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        "   Bentley",
                                        style: TextStyle(
                                            color: Color(0xFFFF8967),
                                            fontSize: 20),
                                      )),
                                  Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text("    V 12 - 563 Hp - 1,700",
                                          style: TextStyle(fontSize: 15))),
                                  Padding(
                                    padding: EdgeInsets.only(left: 12, top: 20),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: MaterialButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CarNavigation()));
                                        },
                                        color: Color(0xFFFF8967),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Text(
                                          'Book Now',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // onTap: () => Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => CarOption()))
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0, left: 120),
                      child: Container(
                        //height: 310,
//                      width: 500,
                        // color: Colors.black,
                        child: Image(
                          width: 350,
                          height: 210,
                          image: AssetImage("assets/Image 3@3x.png"),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
//Recode Stack in on Full Screen
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Stack(children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            height: 190,
                            width: MediaQuery.of(context).size.width / 1.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Color(0xFFFDF0E2),
                            ),
                            child: InkWell(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.7,
                                              child: Text('  Store',
                                                  style:
                                                      TextStyle(fontSize: 30))),
                                        ],
                                      ),
                                    ),
                                    Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          "   Get New Stuff",
                                          style: TextStyle(
                                              color: Color(0xFFFF8967),
                                              fontSize: 20),
                                        )),
                                    Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text("    Shop Now",
                                            style: TextStyle(fontSize: 15))),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 12, top: 20),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: MaterialButton(
                                          onPressed: () {

                                            if(clickstatus)
                                              {

                                                checkconnection();
                                                Future.delayed(Duration(seconds: 1));
                                                if(result != null && result){
                                                  clickstatus=false;
                                                  API.allfoodvendors(StorevendorAPI);
                                                  waittofetchvendors('store');
                                                }
                                                else{
                                                  internettoast();
                                                }
                                              }

                                          },
                                          color: Color(0xFFFF8967),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Text(
                                            'Book Now',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  if(clickstatus)
                                  {

                                    checkconnection();
                                    Future.delayed(Duration(seconds: 1));
                                    if(result != null && result){
                                      clickstatus=false;
                                      API.allfoodvendors(StorevendorAPI);
                                      waittofetchvendors('store');
                                    }
                                    else{
                                      internettoast();
                                    }
                                  }
                                }
                                ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 80.0, left: 200),
                      child: Container(
                        child: Image(
                          height: 150,
                          width: 300,
                          image: AssetImage(
                            'assets/shopbg.png',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Stack(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              height: 190,
                              width: MediaQuery.of(context).size.width / 1.1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Color(0xFFFDF0E2),
                              ),
                              child: InkWell(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.7,
                                              //alignment: Alignment.bottomLeft,
                                              child: Text('  Hotels',
                                                  style:
                                                      TextStyle(fontSize: 30))),
                                        ],
                                      ),
                                    ),
                                    Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          "   Book Hotels",
                                          style: TextStyle(
                                              color: Color(0xFFFF8967),
                                              fontSize: 20),
                                        )),
                                    Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                            "    Book Your Journey In A Single Click ",
                                            style: TextStyle(fontSize: 15))),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 12, top: 20),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: MaterialButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MainScreen()));
                                          },
                                          color: Color(0xFFFF8967),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Text(
                                            'Book Now',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // onTap: () => Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => MainScreen()))
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0, left: 220),
                        child: Container(
                          // color: Colors.black,
                          child: Image(
                            width: 300,
                            height: 180,
                            image: AssetImage("assets/hotel.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              height: 190,
                              width: MediaQuery.of(context).size.width / 1.1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Color(0xFFFDF0E2),
                              ),
                              child: InkWell(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.7,
                                              //alignment: Alignment.bottomLeft,
                                              child: Text('  Flight',
                                                  style:
                                                      TextStyle(fontSize: 30))),
                                        ],
                                      ),
                                    ),
                                    Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          "   Book Your Tour Now",
                                          style: TextStyle(
                                              color: Color(0xFFFF8967),
                                              fontSize: 20),
                                        )),
                                    Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text("    Book Tickets Now",
                                            style: TextStyle(fontSize: 15))),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 12, top: 20),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: MaterialButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Welcome()));
                                          },
                                          color: Color(0xFFFF8967),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Text(
                                            'Book Now',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // onTap: () => Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => Welcome()))
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 120.0, left: 150),
                      child: Container(
                        child: Image(
                          height: 170,
                          width: 210,
                          image: AssetImage("assets/flight.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            height: 190
                            ,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Color(0xFFFDF0E2),
                            ),
                            child: InkWell(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            //alignment: Alignment.bottomLeft,
                                            child: Text('  Saloon',
                                                style:
                                                    TextStyle(fontSize: 30))),
                                      ],
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        "   Rose Pearl",
                                        style: TextStyle(
                                            color: Color(0xFFFF8967),
                                            fontSize: 20),
                                      )),
                                  Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text("    On Your Door Step",
                                          style: TextStyle(fontSize: 15))),
                                  Padding(
                                    padding: EdgeInsets.only(left: 12, top: 20),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: MaterialButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SaloonSelect()));
                                        },
                                        color: Color(0xFFFF8967),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Text(
                                          'Book Now',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // onTap: () => Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => CarOption()))
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0, left: 250),
                      child: Container(
                        child: Image(
                          width: 100,
                          height: 100,
                          image: AssetImage("assets/images/haircut.png"),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
