import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/FlightModule/screens/confirmflight.dart';
class BookFlight extends StatefulWidget {
  @override
  _BookFlightState createState() => _BookFlightState();
}

class _BookFlightState extends State<BookFlight> {
  var selected = Color(0xffd4ebf2);
  Color selectedtext =Colors.blue;
  var selected1 = Color(0xffd4ebf2);
  Color selectedtext1 =Colors.blue;
bool economy=false;
bool elite=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
              children:[
                Container(
                  width: double.infinity,
                  height: 285,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(1),
                      image: new DecorationImage(
                        image: ExactAssetImage('assets/111.jpg'),
                        fit: BoxFit.fill,
                      )),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1.25, sigmaY: 1.25),
                    child: Container(
                      decoration:
                      new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                  child: InkWell(child: Icon(Icons.arrow_back,color: Colors.white,),
                   onTap: (){
                    Navigator.pop(context);
                   },),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
                  child: Text(
                    'Search Flights',
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white),
                  ),
                ),
                //textfielfrom
                Padding(
                  padding: EdgeInsets.only(top: 70.0, left: 20.0, right: 20.0),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color:Colors.white),


                      labelText: 'From', labelStyle: new TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                //icon
                Padding(
                  padding: EdgeInsets.only(top: 150.0, left: 20.0, right: 20.0),
                  child: Transform.rotate(
                      angle: 90 * pi / 180,
                      child: Icon(
                        Icons.compare_arrows,
                        color: Colors.white,
                      )),
                ),
                //textfieldto
                Padding(
                  padding: EdgeInsets.only(top: 170.0, left: 20.0, right: 20.0),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelStyle: new TextStyle(color: Colors.white),
                      labelText: 'To',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white,),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:275.0),
                  child: Column(
                    children: [
                      Container( color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        //height: MediaQuery.of(context).size.height/1.79,

                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:20),
                              child: Container(
                                width: MediaQuery.of(context).size.width/1.1,
                                height: 60,
                                child: Row(
                                  children: [
                                    Container(
                                        width: 60,
                                        height: 60,
                                        child: Image.asset('assets/back.jpg')),
                                    Padding(
                                      padding: const EdgeInsets.only(top:8,left:10),
                                      child: Column(
                                        children: [
                                          Text('American Airline',style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold ),
                                          ),
                                          Text('AA-1264',style: TextStyle(fontSize: 12, color: Colors.black38))
                                        ],

                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:20),
                              child: InkWell(
                                child: Container(
                                  color: selected,
                                  width: MediaQuery.of(context).size.width/1.1,
                                  height: 60,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20,left:10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Economy',style: TextStyle(fontSize: 12, color: selectedtext, fontWeight: FontWeight.bold ),
                                            ),
                                            Text('50 seats left',style: TextStyle(fontSize: 12, color: selectedtext))
                                          ],

                                        ),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 20),
                                        child: Text('\$158.50',style: TextStyle(fontSize: 18, color:selectedtext)),
                                      )

                                    ],
                                  ),
                                ),
                                onTap: (){
                                  setState(() {
                                    selected=Colors.blue;
                                    selectedtext=Colors.white;
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:20),
                              child: InkWell(
                                child: Container(
                                  color: selected1,
                                  width: MediaQuery.of(context).size.width/1.1,
                                  height: 60,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20,left:10),
                                        child: Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Elite',style: TextStyle(fontSize: 12, color: selectedtext1, fontWeight: FontWeight.bold ),
                                            ),
                                            Text('50 seats left',style: TextStyle(fontSize: 12, color: selectedtext1))
                                          ],

                                        ),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 20),
                                        child: Text('\$158.50',style: TextStyle(fontSize: 18, color: selectedtext1)),
                                      )

                                    ],
                                  ),
                                ),
                                onTap: (){
                                  setState(() {
                                    selected1=Colors.blue;
                                    selectedtext1=Colors.white;
                                  });
                                },
                              ),
                            ),

                          ],
                        ),
//                     Container(color: Colors.blue,
//                         height: 60,
//                         width: MediaQuery.of(context).size.width,
//                         child:Center(
//                             child: Text('SORT & FILTERS',style: TextStyle(fontSize: 17, color: Colors.white),)
//                         )
//
                      ),
                    ],
                  ),
                ),

                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top:240.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width/1.3,
                      height: 50,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.shopping_basket),
                                    SizedBox(width: 10,),
                                    Text('6 kg Hand baggage',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 10),),

                                  ],
                                ),
                              ),

                              Container(


                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.shopping_basket),
                                    SizedBox(width: 10,),
                                    Text('20 kg Check-in baggage',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 10),),

                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ),



              ],
          ),

        ),
      ),
      bottomNavigationBar:  InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder:(_)=> ConfirmBooking()));
        },
        child: Container(color: Colors.blue,
          height: 60,
          width: MediaQuery.of(context).size.width,
          child:Center(
              child: Text('Book Now',style: TextStyle(fontSize: 17, color: Colors.white),)
          ),
        ),
      ),
    );
  }
}