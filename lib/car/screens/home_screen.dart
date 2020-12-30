import 'dart:math' as math;
import 'dart:ui';



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:norwayfinalcustomer/car/pages/carooption.dart';

import 'detail_screen.dart';
const stylistData = [
  {
    'stylistName': 'Makkah Motors',
    'salonName': 'Plot No 55,',
    'rating': '4.8',
    'rateAmount': '56',
    'imgUrl': 'assets/Image 3@2x.png',
    'bgColor': Color(0xffFFF0EB),
  },
  {
    'stylistName': 'Makkah Motor Company',
    'salonName': 'Plot No 55',
    'rating': '4.7',
    'rateAmount': '80',
    'imgUrl': 'assets/Image 3@2x.png',
    'bgColor': Color(0xffEBF6FF),
  },
  {
    'stylistName': 'Suzuki Macca Motors',
    'salonName': 'Rashid Minhas Rd',
    'rating': '4.7',
    'rateAmount': '70',
    'imgUrl': 'assets/Image 3@2x.png',
    'bgColor': Color(0xffFFF3EB),
  }
];
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController(viewportFraction: .8);
  var paddingLeft = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ));
  }
  Widget _buildRightSection() {
    return SingleChildScrollView(
      child: Container(
      color:Color(0xff4E295B),
      child:SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CarOption()));
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: MediaQuery.of(context).size.height/0.8,
              width: MediaQuery.of(context).size.width/1.1,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                  bottom: Radius.circular(30)
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Book Elite Class Now',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    StylistCard(stylist: stylistData[0]),
                    StylistCard(stylist: stylistData[1]),
                    StylistCard(stylist: stylistData[2]),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
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
    return Padding(
      padding: const EdgeInsets.only(top:30.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3.2 - 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
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
        ),
      ),
    );
  }
}