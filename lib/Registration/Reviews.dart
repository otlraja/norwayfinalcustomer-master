import 'dart:collection';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:norwayfinalcustomer/Registration/UserData.dart';
import 'package:norwayfinalcustomer/firstpage.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/Component/Style/style.dart';


class Reviews extends StatefulWidget {
  String driverid;

  Reviews({Key key, this.driverid, }) : super(key: key);
  @override
  _ReviewsState createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  TextEditingController ReviewController = TextEditingController();
  double finalRating=0;
  var rates;
  int rating;
  bool rateflag = true;
  var  kk;
  double finals = 0.0;
  var key1;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            body: Container(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.green,
                        ),
                      ),
                      height: size.height / 4,
                      child: Image.asset('assets/reviews.jpg'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 15),
                      child:
                      Text('Rating and Reviews', style: AppFonts.monmblackbold20),
                    ),
                    Text('Please Give Rating or Review to Ride.',
                        style: AppFonts.monm16),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: RatingBar(
                          initialRating: 0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemSize: 30,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                          // itemBuilder: (context, _) => Icon(
                          //   Icons.star,
                          //   color: Colors.yellow,
                          //   size: 5,
                          // ),
                          onRatingUpdate: (rating){
                            setState(() {
                              rates = rating;
                            });
                          }
                      ),

                    ),
                    SizedBox(height: 10,),
                    Padding(
                        padding:
                        EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10),
                        child: InkWell(
                          child: Container(
                            width: MediaQuery.of(context).size.width / 0.8,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.green,
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  children: <Widget>[
                                    TextFormField(
                                      controller: ReviewController,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 3,
                                      decoration: new InputDecoration.collapsed(
                                        hintText:
                                        "Rating..",
                                      ),
                                      validator: (text) {
                                        if (text == null || text.isEmpty) {
                                          return "Review feild is empty";
                                        }
                                        return null;
                                      },
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                          fontStyle: FontStyle.normal),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
                    Padding(
                      padding:
                      EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 0.8,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(
                            color: Colors.green,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: InkWell(
                          onTap: () async {
                            // final prefs = await SharedPreferences.getInstance();
                            if(ReviewController.text != null || rates != null) {
                              Map<String, Object> createDoc = new HashMap();
                              createDoc['rating'] = rates;
                              createDoc['uid'] = UserData.UserId;
                              createDoc['Review'] = ReviewController.text;
                              var key = FirebaseDatabase.instance
                                  .reference()
                                  .child("DriverRatings")
                                  .child(widget.driverid)
                                  .push()
                                  .key;
                              FirebaseDatabase.instance.reference()
                                  .child("DriverRatings")
                                  .child(widget.driverid).child(key)
                                  .set(createDoc);
                              //prefs.setString("RideID", ' ');

                              setState(() {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                         Firstpage()));
                              });
                            }
                            else{
                              Fluttertoast.showToast(
                                  msg:  "Please Give review or Rating",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 3,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          },
                          child: Center(
                              child: new Text("Rate Now",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.0))),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 0.8,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(
                            color: Colors.green,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: InkWell(
                          onTap: () async{
                            // final prefs = await SharedPreferences.getInstance();
                            // prefs.setString("RideID", '');
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Firstpage()));
                          },
                          child: Center(
                              child: new Text( "No now..!",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.0))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
