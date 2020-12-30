
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import 'bookingcarscreen.dart';
import 'detail_screen.dart';
import 'home_screen.dart';



var serviceList = [
  {'title': 'Helicap Royce 2020', 'duration': 45, 'price': 30},
  {'title': 'Helicap 2020', 'duration': 60, 'price': 50},
  {'title': 'Helicap 2020', 'duration': 90, 'price': 75},
  {'title': 'Helicap 2020', 'duration': 30, 'price': 20},
];

class DetailScreenHelicap extends StatefulWidget {
  final stylist;

  const DetailScreenHelicap({Key key, this.stylist}) : super(key: key);
  @override
  _DetailScreenHelicapState createState() => _DetailScreenHelicapState();
}

class _DetailScreenHelicapState extends State<DetailScreenHelicap> {
  PageController pageController = PageController(viewportFraction: .8);
  var paddingLeft = 0.0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xff4E295B),
          resizeToAvoidBottomInset: false,
          body:SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  //DrawerMenu(),
                  Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: _buildRightSection(),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget _buildRightSection() {
    return SingleChildScrollView(

      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(500),
                ),
              ),
              child:Image.asset(
                'assets/detail_bg.png',
                fit: BoxFit.fill,
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.purple.withOpacity(0.1),
            ),
            Positioned(
              top: 50,
              left: 20,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),

            ),
            Positioned(
              top: 50,
              right: 20,

              child:IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),

            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 3.5 - 30,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height-190,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20)
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 130,
                      ),
                      Text(
                        'Service List',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ServiceTile(serviceList[0]),
                      ServiceTile(serviceList[1]),
                      ServiceTile(serviceList[2]),
                      ServiceTile(serviceList[3]),

                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 3 - 120,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 3 ,
                      height: MediaQuery.of(context).size.height / 6 + 20,
                      decoration: BoxDecoration(
                        color: widget.stylist['bgColor'],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Positioned(
                            top: 30,
                            right: -25,
                            child: Image.asset(
                              widget.stylist['imgUrl'],
                              scale: 14.9,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget. stylist['stylistName'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.stylist['salonName'],
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Color(0xffFF8573),
                            ),
                            SizedBox(width: 5),
                            Text(
                              widget.stylist['rating'],
                              style: TextStyle(
                                color: Color(0xffFF8573),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '(${widget.stylist['rateAmount']})',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 10,
              top: MediaQuery.of(context).size.height / 3.5 - 55,
              child: MaterialButton(
                onPressed: () {

                },
                padding: EdgeInsets.all(10),
                shape: CircleBorder(),
                color: Colors.white,
                child: Icon(OMIcons.favoriteBorder),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class ServiceTile extends StatefulWidget {
  final service;
  ServiceTile(this.service);
  @override
  _ServiceTileState createState() => _ServiceTileState();
}

class _ServiceTileState extends State<ServiceTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 40,
                child: Text(
                  widget.service['title'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${widget.service['duration']} Min',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Text(
            '\$${widget.service['price']}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_) =>
                          BookingCar()));
            },
            color: Color(0xff4E295B),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Book',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
class StylistCard extends StatefulWidget {
  final stylist;

  const StylistCard({Key key, this.stylist}) : super(key: key);
  @override
  _StylistCardState createState() => _StylistCardState();
}

class _StylistCardState extends State<StylistCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4 - 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: widget.stylist['bgColor'],
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 20,
            right: -60,
            child: Image.asset(
              widget.stylist['imgUrl'],
              width: MediaQuery.of(context).size.width * 0.60,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.stylist['stylistName'],
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.stylist['salonName'],
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Color(0xff4E295B),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.stylist['rating'],
                      style: TextStyle(
                        color: Color(0xff4E295B),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen(stylist: widget.stylist)));
                  },
                  color: Color(0xff4E295B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Book Now',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//class ServiceTile extends StatelessWidget {


