import 'dart:math';
import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:norwayfinalcustomer/FlightModule/models/places.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'Searchflight.dart';

class Details extends StatefulWidget {
  final Place place;


  Details(this.place);

  @override
  _DetailsState createState() => _DetailsState(this.place);

  // DateTime selectedDate = DateTime.now();
}

class _DetailsState extends State<Details> {
  Place place;
_DetailsState(this.place);





  DateTime _dateTime = DateTime.now();
  DateTime _todateTime = DateTime.now();
  String _formattedate;
  String _toformattedate;

  int travelers=0;
  int children=0;
  int infant=0;

  validatetravelers(){
    if(!(children+infant<=travelers))
      {

      }



  }


  var a ;
  createdate(){
    final f = new DateFormat('dd-MM-yyyy');
    _formattedate = f.format(_dateTime);
    a = (_formattedate.split("-"));


  }
  var b;
  createtodate(){
    final l = new DateFormat('dd-MM-yyyy');
    _toformattedate = l.format(_todateTime);
    b = (_toformattedate.split("-"));
  }
bool valid=false;
  validatedate(){
    if(_toformattedate.compareTo(_formattedate)>0)
      {
        setState(() {
          valid=true;
        });
      }
  }

  @override
  Widget build(BuildContext context) {
     createdate();
     createtodate();
   // String _formattedate = new DateFormat('yyyy-MM-dd').format(_dateTime);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 400,
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: new DecorationImage(
                    image: ExactAssetImage('assets/${place.image}'),
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
              padding: EdgeInsets.only(top: 90.0, left: 20.0, right: 20.0),
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
              padding: EdgeInsets.only(top: 140.0, left: 20.0, right: 20.0),
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
              padding: EdgeInsets.only(top: 230.0, left: 20.0, right: 20.0),
              child: Transform.rotate(
                  angle: 90 * pi / 180,
                  child: Icon(
                    Icons.compare_arrows,
                    color: Colors.white,
                  )),
            ),
            //textfieldto
            Padding(
              padding: EdgeInsets.only(top: 250.0, left: 20.0, right: 20.0),
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



            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 360.0),
//
                child: ToggleSwitch(
                  minWidth: 120.0,
                  minHeight: 50.0,
                  fontSize: 16.0,
                  cornerRadius: 30.0,
                  initialLabelIndex: 0,
                  activeBgColor: Colors.blue,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  labels: ['Round trip', 'One Way'],
                  onToggle: (index) {
                    print('switched to: $index');
                  },
                ),
              ),
            ),
            //depart
            Padding(
              padding: EdgeInsets.only(top: 440.0, left: 20.0, right: 20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "DEPARTURE",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey),
                  ),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 460.0, left: 20.0, right: 20.0),
              child: Row(
                children: <Widget>[
                  Text(
              a[0].toString(),
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32,color: Colors.black),
                  ),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 460.0, left: 70.0, right: 20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    a[1].toString()+" "+a[2].toString(),
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.black),
                  ),

                ],
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(top: 480.0, left: 70.0, right: 20.0),
            //   child: Row(
            //     children: <Widget>[
            //       Text(
            //         "Tuesday",
            //         style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.grey),
            //       ),
            //
            //     ],
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.only(top: 470.0, left: 70.0, right: 20.0),
              child:  IconButton(
                onPressed: () {
                  showDatePicker(
                      context: context,
                      initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                      firstDate: DateTime(2001),
                      lastDate: DateTime(2021)
                  ).then((date) {
                    setState(() {
                      _dateTime = date;
                    });
                  });
                },
                icon: Icon(Icons.calendar_today),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 440.0, left: 180.0, right: 50.0),
              child: Row(
                children: <Widget>[
                  Container(
                    height:60,
                    child: VerticalDivider(
                      width: 5,
                      color: Colors.grey[300],
                      thickness: 2,

                    ),
                  )

                ],
              ),
            ),
            //return
            Padding(
              padding: EdgeInsets.only(top: 440.0, left: 220.0, right: 20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Return",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey),
                  ),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 460.0, left: 220.0, right: 20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    b[0].toString(),
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32,color: Colors.black),
                  ),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 460.0, left: 262.0, right: 20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    b[1].toString()+" "+ b[2].toString(),
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.black),
                  ),

                ],
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(top: 478.0, left: 265.0, right: 20.0),
            //   child: Row(
            //     children: <Widget>[
            //       Text(
            //         "Saturday",
            //         style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.grey),
            //       ),
            //
            //     ],
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.only(top: 470.0, left: 265.0, right: 20.0),
              child:  IconButton(
                onPressed: () {
                  showDatePicker(
                      context: context,
                      initialDate: _todateTime == null ? DateTime.now() : _todateTime,
                      firstDate: DateTime(2001),
                      lastDate: DateTime(2021)
                  ).then((date) {
                    setState(() {

                        _todateTime = date;

                    });
                  });
                },
                icon: Icon(Icons.calendar_today,color: Colors.black,),
              ),
            ),
            //Travel
            // Padding(
            //   padding: EdgeInsets.only(top: 560.0, left: 163.0, right: 20.0),
            //   child: Row(
            //     children: <Widget>[
            //       Text(
            //         "0",
            //         style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32,color: Colors.black),
            //       ),
            //
            //     ],
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.only(top: 562.0, left: 190.0, right: 20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Children",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.black),
                  ),

                ],
              ),
            ),


            Padding(
              padding: EdgeInsets.only(top: 540.0, left: 20.0, right: 20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Travellers",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey),
                  ),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 560.0, left: 23.0, right: 20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    travelers.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32,color: Colors.black),
                  ),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 560.0, left: 68.0, right: 20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Adult",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.black),
                  ),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 580.0, left: 68.0, right: 20.0),
              child: Row(
                children: <Widget>[

                  InkWell(
                    child: Container(
                      child: Center(
                        child: Text(
                          "-",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.black),
                        ),
                      ),
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(

                        color: Colors.grey[200]

                      ),
                    ),
                    onTap: () {
                      setState(() {
                        if(travelers>0) {
                          travelers--;
                        }
                      });

                    },

                  ),
                  SizedBox(width: 7,),
                  InkWell(
                    child: Container(
                      child: Center(
                        child: Text(
                          "+",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.black),
                        ),
                      ),
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(

                          color: Colors.grey[200]

                      ),
                    ),
                    onTap: () {


                          setState(() {
                            travelers++;
                          });

                    },
                  ),




                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 560.0, left: 153.0, right: 20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    children.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32,color: Colors.black),
                  ),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 562.0, left: 190.0, right: 20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Children",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.black),
                  ),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 582.0, left: 190.0, right: 20.0),
              child: Row(
                children: <Widget>[

                  InkWell(
                    child: Container(
                      child: Center(
                        child: Text(
                          "-",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.black),
                        ),
                      ),
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(

                          color: Colors.grey[200]

                      ),
                    ),
                    onTap: () {
                      setState(() {
                        if(children>0) {
                          children--;
                        }
                      });

                    },

                  ),
                  SizedBox(width: 7,),
                  InkWell(
                    child: Container(
                      child: Center(
                        child: Text(
                          "+",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.black),
                        ),
                      ),
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(

                          color: Colors.grey[200]

                      ),
                    ),
                    onTap: () {


                      setState(() {
                        children++;
                      });

                    },
                  ),




                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 560.0, left: 250.0, right: 20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    infant.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32,color: Colors.black),
                  ),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 562.0, left: 290.0, right: 20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Infant",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.black),
                  ),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 582.0, left: 290.0, right: 20.0),
              child: Row(
                children: <Widget>[

                  InkWell(
                    child: Container(
                      child: Center(
                        child: Text(
                          "-",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.black),
                        ),
                      ),
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(

                          color: Colors.grey[200]

                      ),
                    ),
                    onTap: () {
                      setState(() {
                        if(infant>0) {
                          infant--;
                        }
                      });

                    },

                  ),
                  SizedBox(width: 7,),
                  InkWell(
                    child: Container(
                      child: Center(
                        child: Text(
                          "+",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.black),
                        ),
                      ),
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(

                          color: Colors.grey[200]

                      ),
                    ),
                    onTap: () {


                      setState(() {
                        infant++;
                      });

                    },
                  ),




                ],
              ),
            ),
            //cabin class
            Padding(
              padding: EdgeInsets.only(top: 640.0, left: 20.0, right: 20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "CABIN CLASS",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey),
                  ),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 660.0, left: 23.0, right: 20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Eco",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32,color: Colors.black),
                  ),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 660.0, left: 95.0, right: 20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Class",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.black),
                  ),

                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 640.0, left: 153.0, right: 20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "CABIN CLASS",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey),
                  ),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 660.0, left: 153.0, right: 20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Elite",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32,color: Colors.black),
                  ),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 660.0, left: 230.0, right: 20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Class",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.black),
                  ),

                ],
              ),
            ),




            Positioned(
              top: 40,
              left: 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // Padding(
            //     padding: EdgeInsets.only(top: 722.0, left: 0.0, right: 0.0),
            //     child: Container(
            //       child: RaisedButton(
            //           onPressed: () {
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => SearchFlight(place)));
            //           },
            //           textColor: Colors.white,
            //           padding: const EdgeInsets.all(0.0),
            //           child: Container(
            //             width: MediaQuery.of(context).size.width,
            //             decoration: const BoxDecoration(
            //               gradient: LinearGradient(
            //                 colors: <Color>[
            //                   Colors.blue,
            //                   Colors.blue,
            //                   Colors.blue,
            //                 ],
            //               ),
            //             ),
            //             padding: const EdgeInsets.all(10.0),
            //             child: const Text(
            //                 'SEARCH FLIGHTS',
            //                 style: TextStyle(fontSize: 20)
            //             ),
            //           )
            //       ),
            //     )
            // ),

          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SearchFlight(place)));
        },
        child: Container(color: Colors.blue,
          height: 60,
          width: MediaQuery.of(context).size.width,
          child:Center(
              child: Text('SEARCH FLIGHTS',style: TextStyle(fontSize: 17, color: Colors.white),)
          ),
        ),
      ),
    );


  }
}






