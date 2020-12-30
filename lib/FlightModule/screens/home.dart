import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/FlightModule/widgets/images_cards.dart';




class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    child: SafeArea(
    child: Container(
    color: Colors.white,
    child: Column(
    children: <Widget>[
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
    Padding(
    padding: EdgeInsets.only(top: 80.0),
    ),
//                  IconButton(icon: Icon(Icons.menu, color: Colors.black,), onPressed: (){},),
//                  IconButton(icon: Icon(Icons.person_outline, size: 30, color: Colors.black,), onPressed: (){},),
    ],
    ),
    SizedBox(height: 10,),
    Align(
    alignment: Alignment.topLeft,
    child: Padding(
    padding: const EdgeInsets.only(left:8.0),
    child: RichText(
    text: TextSpan(children: [
    TextSpan(text: 'Hello, ', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: Colors.pinkAccent)),
    TextSpan(text: 'what are you\nlooking for?')
    ], style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500, color: Colors.black)),
    ),
    ),
    ),
    SizedBox(height: 20,),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
//                          children: <Widget>[
//                            IconCard(iconData: Icons.home, text: 'Accomodation',),
//                            IconCard(iconData: Icons.directions_bike, text: 'Experiences',),
//                            IconCard(iconData: Icons.directions, text: 'Adventures',),
//                            IconCard(iconData: Icons.flight, text: 'Flights',),
//
//
//                          ],
    ),
    SizedBox(height: 10,),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
    Padding(
    padding: const EdgeInsets.only(left:8.0),
    child: Text('Best Experiences', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
    ),

//                  IconButton(icon: Icon(Icons.more_horiz, color: Colors.black,), onPressed: (){},),

    ],
    ),
    SizedBox(height: 10,),
    Expanded(child: Container(child: ImageCards())),
    SizedBox(height: 25,),
    ],
    ),
    ),
    ),
    )
            ],
          ),

        ));
  }
}
