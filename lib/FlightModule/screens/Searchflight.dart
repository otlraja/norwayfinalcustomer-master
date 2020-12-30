
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/FlightModule/Details_card/details_list.dart';
import 'package:norwayfinalcustomer/FlightModule/models/places.dart';



class SearchFlight extends StatefulWidget {
  Place place;
  SearchFlight(this.place);
  @override
  _SearchFlightState createState() => _SearchFlightState(this.place);
}

class _SearchFlightState extends State<SearchFlight> {
  Place place;
  _SearchFlightState(this.place);
  @override
  List<Widget> _tabScroll() => [
    Tab(
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.expand(width: 60),

        child: Align(
            alignment: Alignment.center,

            child:Column(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(

                  child: Text('23 jul', style: TextStyle(color: Colors.grey, fontSize: 10),),
                ),
                Container(
                  child: Text('\$ 185.50' , style:TextStyle(color: Colors.black, fontSize: 10)),
                ),

              ],
            )
        ),
      ),
    ),
    Tab(
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.expand(width: 60),



        child: Align(
            alignment: Alignment.center,

            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(

                  child: Text('23 jul', style: TextStyle(color: Colors.grey, fontSize: 10),),
                ),
                Container(
                  child: Text('\$ 185.50' , style:TextStyle(color: Colors.black, fontSize: 10)),
                ),

              ],
            )
        ),
      ),
    ),
    Tab(
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.expand(width: 60),



        child: Align(
            alignment: Alignment.center,

            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(

                  child: Text('23 jul', style: TextStyle(color: Colors.grey, fontSize: 10),),
                ),
                Container(
                  child: Text('\$ 185.50' , style:TextStyle(color: Colors.black, fontSize: 10)),
                ),

              ],
            )
        ),
      ),
    ),
    Tab(
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.expand(width: 60),



        child: Align(
            alignment: Alignment.center,

            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(

                  child: Text('23 jul', style: TextStyle(color: Colors.grey, fontSize: 10),),
                ),
                Container(
                  child: Text('\$ 185.50' , style:TextStyle(color: Colors.black, fontSize: 10)),
                ),

              ],
            )
        ),
      ),
    ),
    Tab(
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.expand(width: 60),



        child: Align(
            alignment: Alignment.center,

            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(

                  child: Text('23 jul', style: TextStyle(color: Colors.grey, fontSize: 10),),
                ),
                Container(
                  child: Text('\$ 185.50' , style:TextStyle(color: Colors.black, fontSize: 10)),
                ),

              ],
            )
        ),
      ),
    ),
    Tab(
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.expand(width: 60),



        child: Align(
            alignment: Alignment.center,

            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(

                  child: Text('23 jul', style: TextStyle(color: Colors.grey, fontSize: 10),),
                ),
                Container(
                  child: Text('\$ 185.50' , style:TextStyle(color: Colors.black, fontSize: 10)),
                ),

              ],
            )
        ),
      ),
    ),
    Tab(
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.expand(width: 60),



        child: Align(
            alignment: Alignment.center,

            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(

                  child: Text('23 jul', style: TextStyle(color: Colors.grey, fontSize: 10),),
                ),
                Container(
                  child: Text('\$ 185.50' , style:TextStyle(color: Colors.black, fontSize: 10)),
                ),

              ],
            )
        ),
      ),
    ),
    Tab(
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.expand(width: 60),



        child: Align(
            alignment: Alignment.center,

            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(

                  child: Text('23 jul', style: TextStyle(color: Colors.grey, fontSize: 10),),
                ),
                Container(
                  child: Text('\$ 185.50' , style:TextStyle(color: Colors.black, fontSize: 10)),
                ),

              ],
            )
        ),
      ),
    ),
    Tab(
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.expand(width: 60),



        child: Align(
            alignment: Alignment.center,

            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(

                  child: Text('23 jul', style: TextStyle(color: Colors.grey, fontSize: 10),),
                ),
                Container(
                  child: Text('\$ 185.50' , style:TextStyle(color: Colors.black, fontSize: 10)),
                ),

              ],
            )
        ),
      ),
    ),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
            child: DefaultTabController(
              length: 9,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Container(
                      height: MediaQuery.of(context).size.height/8,
                      width: MediaQuery.of(context).size.width,

                      child:  Row(
                        children: [
                         Stack(
                           children: [
                             Container(
                               width: MediaQuery.of(context).size.width,
                               height: 100,
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
                             Container(
                               width: 50,
                               child: Padding(
                                 padding: const EdgeInsets.only(bottom:35),
                                 child: IconButton(
                                   icon: InkWell(child: Icon(Icons.arrow_back, color: Colors.white,),
                                   onTap: (){
                                     Navigator.pop(context);
                                   },
                                   ),
                                 ),
                               ),
                             ),

                             Padding(
                               padding: const EdgeInsets.only(top: 20,),
                               child: Container(
                                 width: MediaQuery.of(context).size.width/1.2,
                                 child: Column(
                                   children: [
                                     Text("Houstone To Manhattan",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: "asdf",fontSize: 18),),

                                     Padding(
                                       padding: const EdgeInsets.only(top:15,left: 50),
                                       child: Text("Departure 23 Jul . 1 Traveller . Economy",style: TextStyle(color: Colors.white,fontFamily: "asdr",fontSize: 14),textAlign: TextAlign.center,),
                                     )
                                   ],
                                 ),
                               ),
                             ),
                           ],
                         ),
                        ],
                      ),
                    ),
                    ),

                  Container(
                    constraints: BoxConstraints.expand(height: 70),
                    child: TabBar(isScrollable: true, tabs: _tabScroll()),),
                      Expanded(
                        child: Container(
                          child: TabBarView(children: [
                            SingleChildScrollView(
                                child:  Container( height:MediaQuery.of(context).size.height,child: bestList())
                            ),
                            SingleChildScrollView(
                                child:  Container( height:MediaQuery.of(context).size.height,child: bestList())
                            ),
                            SingleChildScrollView(
                                child:  Container( height:MediaQuery.of(context).size.height,child: bestList())
                            ),
                            SingleChildScrollView(
                                child:  Container( height:MediaQuery.of(context).size.height,child: bestList())
                            ),
                            SingleChildScrollView(
                                child:  Container( height:MediaQuery.of(context).size.height,child: bestList())
                            ),
                            SingleChildScrollView(
                                child:  Container( height:MediaQuery.of(context).size.height,child: bestList())
                            ),
                            SingleChildScrollView(
                                child:  Container( height:MediaQuery.of(context).size.height,child: bestList())
                            ),
                            SingleChildScrollView(
                                child:  Container( height:MediaQuery.of(context).size.height,child: bestList())
                            ),
                            SingleChildScrollView(
                                child:  Container( height:MediaQuery.of(context).size.height,child: bestList())
                            ),
                          ]),
                      ),
                      ),

                ],
              ),
            ),
          ),
      bottomNavigationBar:  Container(color: Colors.blue,
        height: 60,
        width: MediaQuery.of(context).size.width,
        child:Center(
            child: Text('SORT & FILTERS',style: TextStyle(fontSize: 17, color: Colors.white),)
        ),
      ),
        );


  }
}
