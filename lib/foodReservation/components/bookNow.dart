import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/foodModule/Screen/Foodmsg_view.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/Component/Style/style.dart';

import '../../PaymentCardSelect.dart';
class BooknowReservation extends StatefulWidget {
  @override
  _BooknowReservationState createState() => _BooknowReservationState();
}

class _BooknowReservationState extends State<BooknowReservation> {
  Widget Popup(){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Do You Want To Print Out"),
            actions:[
              FlatButton(
                onPressed: (){
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (_) => Ridersdetail()));
                },
                child: Text("Yes"),
              ),
              FlatButton(
                onPressed: (){
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (_) => Ridersdetail()));
                },
                child: Text("No"),
              ),
            ],
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[

                  Container(
                    // height: size.height / 1.2,
                    child: Column(
                      children: <Widget>[
                        Container(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                color: Colors.white,
                                //height: size.height / 12,
                                child: IconButton(
                                  icon: Icon(Icons.arrow_back_ios),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                        padding: EdgeInsets.only(left: 10),
                                        color: Colors.white,
                                        height: size.height / 20,
                                        child: Image.asset('images/bageterie.png')),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      //width: size.width / 2,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'B&B',
                                            style: AppFonts.monm,
                                          ),
                                          Text(
                                            'Street 12 Norway',
                                            style: AppFonts.monmgrey12,
                                          )
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Container(

                                      //width: size.width / 7,
                                      child: IconButton(
                                        // color: Color(0xff7ac81d),
                                          color: Colors.blue,
                                          icon: Icon(Icons.message),
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        Foodmsgview()));
                                          }),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(right: 10),
                                      child: IconButton(
                                          color: Colors.blue,
                                          icon: Icon(Icons.phone),
                                          onPressed: () {}),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 400,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Container(
                                    height: 40,
                                    child: Text(
                                      'PAYMENT INFO',
                                      style: AppFonts.monmgreybold12,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Container(
                                      child: Row(
                                        children: <Widget>[
                                          Text('Advance'),
                                          Spacer(),
                                          Container(
                                              width: 60,
                                              child: Text(
                                                '\$ 10.00',
                                                style: AppFonts.monm,
                                              )),
                                        ],
                                      )),
                                ),
                                Container(
                                  child: Divider(
                                    thickness: 0.5,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Container(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            'Sales Tax',
                                            style: AppFonts.monm,
                                          ),
                                          Spacer(),
                                          Container(
                                              width: 60,
                                              child: Text(
                                                '\$ 1.50',
                                                style: AppFonts.monm,
                                              )),
                                        ],
                                      )),
                                ),
                                Container(
                                  child: Divider(
                                    thickness: 0.5,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Container(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            'Remining Amount',
                                            style: AppFonts.monm15bold,
                                          ),
                                          Spacer(),
                                          Container(
                                              width: 60,
                                              child: Text(
                                                '\$ 90.50',
                                                style: AppFonts.monm15bold,
                                              )),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 60,
                          child: Container(
                              color: Colors.white,
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: CircleAvatar(
                                            radius: 20,
                                            child: Image.asset('images/bageterie.png'),
                                          ),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left:8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  'Monday 2 Jan 2021',
                                                  style: AppFonts.monm,
                                                ),
                                                Text(
                                                  'For 4 Person',
                                                  style: AppFonts.monm,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.blue,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height/9,
                          child: Container(

                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[

                                    Row(
                                      children: [
                                        Text('Payment Method',style: TextStyle(fontWeight: FontWeight.bold),),
                                        Spacer(),
                                        InkWell(child: Text('Change',style:TextStyle(color: Color(0xff4E295B)))
                                          ,
                                          onTap: (){
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(builder: (_) => PaymentCardDetails()));
                                          },
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top:10.0),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            alignment:Alignment.center,
                                            child: Icon(
                                              Icons.credit_card,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          InkWell(
                                            child: Container(

                                              padding: const EdgeInsets.only(left:12.0),
                                              child: Text(
                                                '432565*******',
                                                style: AppFonts.monm,

                                              ),
                                            ),
                                            onTap: (){
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(builder: (_) => PaymentCardDetails()));
                                            },
                                          ),
                                          Spacer(),
                                          Container(
                                            child: Column(
                                              children: [

                                                Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.blue,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),


                ],
              ),
            ),
          ),
        ),

      ),
      bottomNavigationBar: BottomAppBar(
        child: InkWell(
          child: Container(
            height: 50,
            alignment: Alignment.center,
            width: size.width / 1,
            color: Colors.blue,
            child: Text(
              'Reserve Now',
              style: AppFonts.monmwhit16,
            ),
          ),
          onTap: (){
            Popup();
          },
        ),
      ),
    );
  }
}
