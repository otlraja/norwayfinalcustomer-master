import 'package:flutter/material.dart';

class ConfirmBooking extends StatefulWidget {
  @override
  _ConfirmBookingState createState() => _ConfirmBookingState();
}

class _ConfirmBookingState extends State<ConfirmBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height/1.7,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10 , left: 10 , right: 20),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children : [

                              Container(
                                  child:Row(
                                      children:[
                                        InkWell(
                                          child: Container(
                                            child: Icon( Icons.arrow_back),
                                          ),
                                          onTap: (){
                                            Navigator.pop(context);
                                          },
                                        ),
                                        Container(
                                            padding: EdgeInsets.only(left: 75),
                                            child: Text('Confirm Booking',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                                        )
                                      ]

                                  )
                              ),
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
                                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                padding: const EdgeInsets.only(top: 35,left: 50),
                                child: Text('Departure from', style: TextStyle(fontSize: 12, color: Colors.black45 , fontWeight: FontWeight.bold),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5,left: 15),
                                child: Row(
                                  children: [
                                    Container(
                                      child: Icon(Icons.flight_takeoff, color: Colors.blue,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text('HOU - Houstone, USA',style: TextStyle(fontSize: 18 ,fontWeight: FontWeight.bold),),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30,left: 50),
                                child: Text('Arrival at', style: TextStyle(fontSize: 12, color: Colors.black45,fontWeight: FontWeight.bold),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5,left: 15),
                                child: Row(
                                  children: [
                                    Container(
                                      child: Icon(Icons.flight_land, color: Colors.blue,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text('MHK - Manhattan, USA',style: TextStyle(fontSize: 18 ,fontWeight: FontWeight.bold),),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15 , top: 35),
                                    child: Container(
                                        child: Text('Departure', style: TextStyle(fontSize: 12),)
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Container(
                                        child: Text('Arrival', style: TextStyle(fontSize: 12),)
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15 , ),
                                    child: Container(
                                        child: Text('23 Jun, 12:35 am', style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                      child: Text('24 Jun, 10:00 am', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),)
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30,left: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Container(
                                        width: 70,
                                        child: Text('Class', style: TextStyle(fontSize: 10),)
                                    ),
                                    Container(
                                        width: 40,
                                        child: Text('Gate', style: TextStyle(fontSize: 10),)
                                    ), Container(
                                        width: 25,
                                        child: Text('Seat', style: TextStyle(fontSize: 10),)
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Container(
                                        width:70,
                                        child: Text('Economy', style: TextStyle(fontSize: 13),)
                                    ),
                                    Container(
                                        width: 40,
                                        child: Text('C11', style: TextStyle(fontSize: 13),)
                                    ), Container(
                                        width: 25,
                                        child: Text('B12', style: TextStyle(fontSize: 13),)
                                    )
                                  ],
                                ),
                              ),


                            ]
                        ),
                      ),
                    ),
                    Container(
                      color: Color(0xffdadada),
                      height: MediaQuery.of(context).size.height/3.3,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(top: 10 ,),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20 , left: 25 , right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Text('Payment info',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Fare Charges', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                  Text('\$ 150.00', style: TextStyle(fontWeight:FontWeight.bold),)],
                              ),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Convenince Charges', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                Text('\$ 10.00', style: TextStyle(fontWeight:FontWeight.bold),)],
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Cancellation Charges', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                Text('\$ 5.00', style: TextStyle(fontWeight:FontWeight.bold),)],
                            ),



                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
          ),

      ),
      bottomNavigationBar:    InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder:(_)=> ConfirmBooking()));
        },
        child: Container(color: Colors.blue,
          height: 70,
          width: MediaQuery.of(context).size.width,
          child:Center(
              child: Text('Book Now',style: TextStyle(fontSize: 17, color: Colors.white),)
          ),
        ),
      ),
    );
  }
}