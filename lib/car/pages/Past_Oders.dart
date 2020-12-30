import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:norwayfinalcustomer/Component/Style/style.dart';
import 'package:norwayfinalcustomer/Registration/UserData.dart';
import 'package:norwayfinalcustomer/car/pages/PastOrdersModel.dart';
import 'package:norwayfinalcustomer/car/pages/ongoingordersModel.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/Component/Color/color.dart';

class Past_Order extends StatefulWidget {
  @override
  Past_OrderState createState() => Past_OrderState();
}

class Past_OrderState extends State< Past_Order> {
  DatabaseReference  HistoryRef;
  List<PastOrdersModel>  PastOrdersList;
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    PastOrdersList = new List();
    setState(() {
      PastOrdersSnapshot();
    });
    super.initState();
  }
  Future<void> PastOrdersSnapshot() {
    final User user = _auth.currentUser;
    FirebaseDatabase database = FirebaseDatabase.instance;
    database.setPersistenceEnabled(true);
    database.setPersistenceCacheSizeBytes(10000000);
    database.reference().child('journey_history').onValue.listen((event) {
      HistoryRef = database.reference().child('journey_history');
      HistoryRef.once().then((DataSnapshot snapshot) {
        PastOrdersList.clear();
        Map<String, dynamic> mapOfMaps = Map.from(snapshot.value);
        mapOfMaps.values.forEach((value) {
          setState(() {
            if(user.uid==value['CustomerId'] && value["isJourneyEnded"]==true)
              PastOrdersList.add(PastOrdersModel(
                value['CustomerId'],
                  value['acceptedByID'],
                  value['acceptedByName'],
                  value["RequestId"],
                  value["ToAddress"],
                  value['FromAddress'],
                  value['distance'],
                  value['FromLatitude'],
                  value['FromLongitude'],
                  value['ToLatitude'],
                  value['ToLongitude'],
                  value['isAccepted'],
                  value['isJourneyCancelled'],
                  value['isJourneyEnded'],
                  value['isJourneyStarted'],
                  value['isPickedUp'],
                  value['duration'],
                  value['RidDate'],
                  value['ServiceBudget'],
                  value['RideTime'],
                  value['ServiceType'],
                  value['Serviceimage'],
                  value['Price'],
                  value['isJourneyCancelledbyCustomer'],
                  value['isJourneyCancelledbyDriver']
              ));
            setState(() {
              list();
            });
          });
        });
      });
    });
  }
  Widget list() {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount:  PastOrdersList.length,
        itemBuilder: (_, index) {
          return ReqBooking(PastOrdersList[index]);
        });
  }
  Widget ReqBooking(PastOrdersModel pastOrdersModel){
    var size= MediaQuery.of(context).size;
    return Card(
      child: Container(
        height: 290,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            color: Colors.white
        ),
        child: Column(
          children: [
            SizedBox(height: 8,),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(

                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 40,
                              height: 40,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 35,
                                backgroundImage: NetworkImage(
                                  pastOrdersModel.Serviceimage== null ? 'https://firebasestorage.googleapis.com/v0/b/norway-568bb.appspot.com/o/bike.png?alt=media&token=ad957b1d-74ee-4dde-b0ef-4b874b1b3ac6' : pastOrdersModel.Serviceimage,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: size.width*0.23,
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(pastOrdersModel.ServiceType==null?"car":pastOrdersModel.ServiceType,style: TextStyle(fontSize: 12),),
                                SizedBox(height: 4,),
                                Text(pastOrdersModel.ServiceBudget ==null?"200":pastOrdersModel.ServiceBudget.toString()+"\$" ,style: TextStyle(fontSize: 12),),
                              ],
                            ),
                          ),
                          Container(
                            width: size.width*0.45,
                            child: Row(
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  child: Image.asset("assets/dp.png"),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(pastOrdersModel.acceptedByName==null?"DriverName":pastOrdersModel.acceptedByName ,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                    RatingBarIndicator(
                                      rating: 4.5,
                                      itemBuilder: (context, index) => Icon(Icons.star,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 15.0,
                                      unratedColor: Colors.amber.withAlpha(50),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
            ),
            Container(
              height: 55,
              width: size.width,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.location_on,
                      color: AppColors.blueColor,
                      size: 16,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: size.width / 1.3,
                        child: Row(
                          children: <Widget>[
                            Text("From : ",
                              style: AppFonts.monmbold,
                            ),

                          ],
                        ),
                      ),
                      Container(
                        width: size.width / 1.3,
                        height: 35,
                        child: Text(pastOrdersModel.FromAddress==null?"Hemliton Street, union Market USA":pastOrdersModel.FromAddress,
                          style: AppFonts.monr11,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0,bottom: 8),
              child: Container(
                height: 55,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.navigation,
                        color: AppColors.blueColor,
                        size: 16,
                      ),
                    ),
                    Container(
                      height: 90,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'To : ',
                            style: AppFonts.monmbold,
                          ),
                          Container(
                            width: size.width / 1.3,
                            height: 35,
                            child: Text(
                              pastOrdersModel.ToAddress==null?'Hemliton Street, union Market USA':pastOrdersModel.ToAddress,
                              style: AppFonts.monr11,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 12,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text("Duration: ",style: TextStyle(fontSize: 14,color: AppColors.blueColor,fontWeight: FontWeight.bold),),
                  SizedBox(width: 4,),
                  RichText(
                      text: TextSpan(
                          text:  pastOrdersModel.distance==null?"Distance":pastOrdersModel.distance ,

                          style: AppFonts.monmgrey,
                          children: <TextSpan>[
                            TextSpan(text:" ( ",style: AppFonts.monrgrey),
                            TextSpan(
                                text: pastOrdersModel.duration==null?"2 mins":pastOrdersModel.duration,
                                style: AppFonts.monrgrey),
                            TextSpan(text:" ) ",style: AppFonts.monrgrey),
                          ])),
                  Spacer(),
                  Icon(Icons.message,size: 15,color: AppColors.blueColor,)
                ],
              ),
            ),
            SizedBox(height: 12,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text("Price:",style: TextStyle(color: AppColors.blueColor,fontSize: 14,fontWeight: FontWeight.bold),),
                  SizedBox(width: 4,),
                  Text(pastOrdersModel.price==null?"560\$ ":pastOrdersModel.price.toString()+"\$",
                    style: AppFonts.monrgrey,),

                ],
              ),
            ),
            SizedBox(height: 3,),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text("Date:",
                        style:TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColors.blueColor),),
                      SizedBox(width: 4,),
                      Text(pastOrdersModel.RidDate==null? "12/6/20 ":pastOrdersModel.RidDate,
                        style: AppFonts.monmgrey,),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text("Time: ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: AppColors.blueColor),),
                      Text(pastOrdersModel.RideTime ==null? "00:00 ":pastOrdersModel.RideTime,style: AppFonts.monmgrey,),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if(PastOrdersList.isEmpty ){
      return SafeArea(
        child: Scaffold(
          body:  Center(
            child: Container(
              child: Text( "No Order Yet..!",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green[500]),),),
          ),
        ),
      );
    }else{
      return SafeArea(
          child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 1.02,
                        child: list()
                    ),
                  ],
                ),
              )
          )
      );
    }
  }
}
