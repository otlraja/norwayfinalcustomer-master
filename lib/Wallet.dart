import 'package:flutter/material.dart';

class HScreen extends StatefulWidget {
  @override
  _HScreenState createState() => _HScreenState();
}

class _HScreenState extends State<HScreen> {

  int selected_value =0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
   //   width: double.infinity,
          child: Stack(
            children: <Widget>[
              //Container for top data
              Container(
                color: Colors.blue[900],
                child: Container(

                   margin: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "\$2589.90",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.w700),
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.notifications,
                                  color: Colors.lightBlue[100],
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.white,
                                  child: ClipOval(
                                    child: Image.asset(
                                      "assets/pro.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Text(
                        "Available Balance",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.blue[100]),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(243, 245, 248, 1),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(18))),
                                    child: Icon(
                                      Icons.directions_car,
                                      color: Colors.blue[900],
                                      size: 30,
                                    ),
                                    padding: EdgeInsets.all(12),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Car",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: Colors.blue[100]),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                selected_value=0;
                              });
                            },
                          ),
                          InkWell(
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(243, 245, 248, 1),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(18))),
                                    child: Icon(
                                      Icons.fastfood,
                                      color: Colors.blue[900],
                                      size: 30,
                                    ),
                                    padding: EdgeInsets.all(12),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Food",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: Colors.blue[100]),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                selected_value=1;
                              });
                            },
                          ),
                          InkWell(
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(243, 245, 248, 1),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(18))),
                                    child: Icon(
                                      Icons.accessibility_new,
                                      color: Colors.blue[900],
                                      size: 30,
                                    ),
                                    padding: EdgeInsets.all(12),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "salon",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: Colors.blue[100]),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                selected_value=2;
                              });
                            },
                          ),
                          InkWell(
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(243, 245, 248, 1),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(18))),
                                    child: Icon(
                                      Icons.shopping_basket,
                                      color: Colors.blue[900],
                                      size: 30,
                                    ),
                                    padding: EdgeInsets.all(12),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Clothing",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: Colors.blue[100]),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                selected_value=3;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),

              //draggable sheet
              DraggableScrollableSheet(
                builder: (context, scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(243, 245, 248, 1),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 24,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Recent Transactions",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 24,
                                      color: Colors.black),
                                ),
                                Text(
                                  "See all",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Colors.grey[800]),
                                )
                              ],
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 32),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          //Container for buttons
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 32),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "All",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: Colors.grey[900]),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey[200],
                                            blurRadius: 10.0,
                                            spreadRadius: 4.5)
                                      ]),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      CircleAvatar(
                                        radius: 8,
                                        backgroundColor: Colors.green,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "Paid",

                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                            color: Colors.grey[900]),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey[200],
                                            blurRadius: 10.0,
                                            spreadRadius: 4.5)
                                      ]),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      CircleAvatar(
                                        radius: 8,
                                        backgroundColor: Colors.orange,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "Pending",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                            color: Colors.grey[900]),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey[200],
                                            blurRadius: 10.0,
                                            spreadRadius: 4.5)
                                      ]),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                )
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 16,
                          ),

                          SizedBox(
                            height: 16,
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 5.0,right: 5.0),
                            child: Card(elevation: 2,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                              //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 35.0,right: 35.0,top: 15.0,bottom: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          child: Text('Kr. ', style: TextStyle(
                                            fontSize: 32,
                                            fontStyle: FontStyle.italic,
                                          ),),
                                        ),

                                      ],
                                    ),
                                    Container(

                                      child: selected_value ==0 ?

                                      Text('98.50', style: TextStyle(
                                        fontSize:40,color: Colors.green,
                                        fontWeight: FontWeight.w700,
                                      ),):
                                      selected_value ==1 ?
                                      Text('158.50', style: TextStyle(
                                        fontSize:40,color: Colors.green,
                                        fontWeight: FontWeight.w700,
                                      ),):
                                      selected_value ==2 ?
                                      Text('208.50', style: TextStyle(
                                        fontSize:40,color: Colors.green,
                                        fontWeight: FontWeight.w700,
                                      ),):
                                      Text('268.50', style: TextStyle(
                                        fontSize:40,color: Colors.green,
                                        fontWeight: FontWeight.w700,
                                      ),)
                                    ),
                                    SizedBox(height: 10.0),
                                    Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('Available Credit', style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                        )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),


                          //now expense
                        ],
                      ),
                      //controller: scrollController,
                    ),
                  );
                },
                initialChildSize: 0.65,
                minChildSize: 0.65,
                maxChildSize: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
