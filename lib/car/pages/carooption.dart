import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:norwayfinalcustomer/Registration/login.dart';
import 'package:norwayfinalcustomer/car/screens/HomeScreenHelicap.dart';
import 'package:norwayfinalcustomer/car/screens/home_screen.dart';
import 'package:norwayfinalcustomer/firstpage.dart';
import 'Taxi_Map.dart';

const stylistData = [
  {
    'stylistName': 'Book Helicopter Now',
    'salonName': 'Enjoy Your Flight Now',
    'rateAmount': '56',
    'imgUrl': 'assets/helicap.png',
    'bgColor': Color(0xffFFF0EB),
  },
  {
    'stylistName': 'Book Elite Class Now',
    'salonName': 'Feel The Royal Class Now',
    'rateAmount': '80',
    'imgUrl': 'assets/Image 3@3x.png',
    'bgColor': Color(0xffEBF6FF),
  },
  {
    'stylistName': 'Book your Taxi Now',
    'salonName': 'Enjoy Your Ride',
    'rateAmount': '70',
    'imgUrl': 'assets/taxi.png',
    'bgColor': Color(0xffFFF3EB),
  }
];
    class CarOption extends StatefulWidget {
//      final stylist;
//
//     const CarOption({Key key, this.stylist}) : super(key: key);
      @override
      _CarOptionState createState() => _CarOptionState();
    }

    class _CarOptionState extends State<CarOption> {
      var paddingLeft = 0.0;
      FirebaseAuth _auth = FirebaseAuth.instance;

      @override
      Widget build(BuildContext context) {
        return Card(
          child: SafeArea(
            child: Scaffold(
                backgroundColor: Color(0xff4E295B),
                resizeToAvoidBottomInset: false,
                body: SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                   child: Stack(
                     children: <Widget>[
                       //DrawerMenu(),
                       _buildRightSection(),
                     ],
                   ),

                  ),
                ),
            ),
          ),
        );
      }
      Widget _buildRightSection() {
        return SingleChildScrollView(
          child: Container(
              width: MediaQuery.of(context).size.width,
              color:Color(0xff4E295B),
              child:SafeArea(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20,),
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
                                      builder: (context) => Firstpage()));
                            },
                          ),
//                              IconButton(
//                                icon: Icon(
//                                  Icons.search,
//                                  color: Colors.white,
//                                ),
//                                onPressed: () {},
//                              ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height/1.35,
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
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 50,
                              ),
                              Text(
                                'Wanna Book Now',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:30.0),
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height / 3.2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(0xffFFF3EB),
                                    ),
                                    child: Stack(
                                      children: <Widget>[
                                        Positioned(
                                          top: 90,
                                          right: -10,
                                          child: Image.asset(
                                            'assets/taxi.png',
                                            width: MediaQuery.of(context).size.width * 0.40,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 55, left: 10),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Book your Taxi Now',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Enjoy Your Ride',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),

                                              SizedBox(
                                                height: 10,
                                              ),
                                              MaterialButton(
                                                onPressed: () {
                                                  final User user = _auth.currentUser;
                                                  if (user == null) {
                                                    setState(() {
                                                      Navigator.of(context)
                                                          .push(MaterialPageRoute(builder: (_) => Login()));
                                                    });
                                                  } else{
                                                    Navigator.of(context)
                                                        .push(MaterialPageRoute(builder: (_) => Taxi_Map()));
                                                  }
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
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:30.0),
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height /3.2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(0xffFFF3EB),
                                    ),
                                    child: Stack(
                                      children: <Widget>[
                                        Positioned(
                                          top: 40,
                                          right: -40,
                                          child: Image.asset(
                                            'assets/Image 3@3x.png',
                                            width: MediaQuery.of(context).size.width * 0.60,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 55, left: 10),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Book Elite Class Now',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Feel The Royal Class Now',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),

                                              SizedBox(
                                                height: 30,
                                              ),
                                              MaterialButton(
                                                onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => HomeScreen()));
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
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:30.0),
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Container(
                                    //margin: EdgeInsets.symmetric(vertical: 20),
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height/3.2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(0xffFFF3EB),
                                    ),
                                    child: Stack(
                                      children: <Widget>[
                                        Positioned(
                                          top: 80,
                                          right: -50,
                                          child: Image.asset(
                                            'assets/helicap.png',
                                            width: MediaQuery.of(context).size.width * 0.40,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 55, left: 10),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Book Helicopter Now',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Enjoy Your Flight Now',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),

                                              SizedBox(
                                                height: 30,
                                              ),
                                              MaterialButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => HomeScreenHelicap()));
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
                                              SizedBox(
                                                height: 8,
                                              ),
                                            ],

                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                                  SizedBox(height: 10,)
//                                StylistCard(stylist: stylistData[0]),
//                                StylistCard(stylist: stylistData[1]),
//                                StylistCard(stylist: stylistData[2]),
                            ],
                          ),
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

