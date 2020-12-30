import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:norwayfinalcustomer/Component/Style/style.dart';
import 'package:norwayfinalcustomer/Registration/UserData.dart';
import 'package:norwayfinalcustomer/car/pages/PastOrdersModel.dart';
import 'package:norwayfinalcustomer/car/pages/TrackDriver.dart';
import 'package:norwayfinalcustomer/car/pages/ongoingordersModel.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/Component/Color/color.dart';

class On_Going_Order extends StatefulWidget {
  @override
  _On_Going_OrderState createState() => _On_Going_OrderState();
}

class _On_Going_OrderState extends State<On_Going_Order> {
  DatabaseReference  HistoryRef,ReqRef;
  List<PastOrdersModel>  PastOrdersList;
  List<OnGoingOrdersModel>OnGoingOrdersList;
  final databaseReference = FirebaseDatabase.instance.reference();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState(){
    PastOrdersList = new List();
    OnGoingOrdersList= new List();
    setState((){
      OnGoingOrdersSnapshot();
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
            if(user.uid== value['CustomerId'] && value['isJourneyEnded']==false)
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
              list2();
            });
          });
        });
      });
    });
  }
  Future<void> OnGoingOrdersSnapshot(){
    final User user = _auth.currentUser;
    FirebaseDatabase database = FirebaseDatabase.instance;
    database.setPersistenceEnabled(true);
    database.setPersistenceCacheSizeBytes(10000000);
    database.reference().child('Request').onValue.listen((event) {
      final FirebaseDatabase database = FirebaseDatabase.instance;
      ReqRef = database.reference().child('Request');
      ReqRef.once().then((DataSnapshot snapshot) {
        OnGoingOrdersList.clear();
        Map<String, dynamic> mapOfMaps = Map.from(snapshot.value);
        mapOfMaps.values.forEach((value) {
          setState((){
            if(user.uid== value['CustomerId'])
              OnGoingOrdersList.add(OnGoingOrdersModel(
                  value['CustomerId'],
                  value['CustomerName'],
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
              ));
            setState(() {
              list();
            });
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if(PastOrdersList.isEmpty && OnGoingOrdersList.isEmpty){
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
                      margin: EdgeInsets.symmetric(horizontal: 3),
                        child: list()
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 3),
                        child: list2()
                    ),
                  ],
                ),
              )
          )
      );
    }
  }
  Widget list() {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount:  OnGoingOrdersList.length,
        itemBuilder: (_, index) {
          return ReqBooking(OnGoingOrdersList[index] );
        });
  }
  Widget list2() {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount:  PastOrdersList.length,
        itemBuilder: (_, index) {
          return OngoingBooking(PastOrdersList[index]);
        });
  }
  Widget ReqBooking(OnGoingOrdersModel onGoingOrdersModel){
    var size= MediaQuery.of(context).size;
    return Card(
      child: Container(
        height: 330,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            color: Colors.white
        ),
        child: Column(
          children: [
            SizedBox(height: 8,),
            ReqRideStatus(),
            SizedBox(height: 8,),
            Container(
              height: 1,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                height: 0,
                thickness: 1,
                color: Colors.black38,
              ),
            ),
            SizedBox(height: 8,),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                      width: size.width*0.45,
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
                                  onGoingOrdersModel.Serviceimage == null ? 'https://firebasestorage.googleapis.com/v0/b/norway-568bb.appspot.com/o/bike.png?alt=media&token=ad957b1d-74ee-4dde-b0ef-4b874b1b3ac6' : onGoingOrdersModel.Serviceimage,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              Text(onGoingOrdersModel.ServiceType==null?"Car":onGoingOrdersModel.ServiceType,
                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,letterSpacing: 0.5),),
                              SizedBox(height: 4,),
                              Text(onGoingOrdersModel.ServiceBudget ==null?"200":onGoingOrdersModel.ServiceBudget.toString()+"\$" ,
                                style: TextStyle(fontSize: 12,letterSpacing: 0.5),),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )
            ),
            SizedBox(height: 5,),
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
                        width: size.width / 3,
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
                        child: Text(onGoingOrdersModel.FromAddress==null?"Hemliton Street, union Market USA":onGoingOrdersModel.FromAddress,
                          style: AppFonts.monr11.copyWith(color: Colors.grey[900]),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0,bottom: 4),
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
                              onGoingOrdersModel.ToAddress==null?'Hemliton Street, union Market USA':onGoingOrdersModel.ToAddress,
                              style: AppFonts.monr11.copyWith(color: Colors.grey[900]),
                            ),
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text("Duration: ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: AppColors.blueColor),),
                  SizedBox(width: 4,),
                  RichText(
                      text: TextSpan(
                          text:  onGoingOrdersModel.distance==null?"Distance":onGoingOrdersModel.distance ,

                          style: AppFonts.monmgrey,
                          children: <TextSpan>[
                            TextSpan(text:" ( ",style: TextStyle(fontSize: 12)),
                            TextSpan(
                                text: onGoingOrdersModel.duration==null?"2 mins":onGoingOrdersModel.duration,
                                style: AppFonts.monrgrey),
                            TextSpan(text:" ) ",style: TextStyle(fontSize: 12)),
                          ])),
                  Spacer(),
                  Icon(Icons.message,size: 15,color: AppColors.blueColor,)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text("Price:",style: TextStyle(fontSize: 14,color: AppColors.blueColor,fontWeight: FontWeight.bold),),
                  SizedBox(width: 4,),
                  Text(onGoingOrdersModel.price==null?"560\$ ":onGoingOrdersModel.price.toString()+"\$",style: AppFonts.monmgrey,),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text("Date: ",style: TextStyle(fontSize: 14,color: AppColors.blueColor,fontWeight: FontWeight.bold),),
                      SizedBox(width: 4,),
                      Text(onGoingOrdersModel.RidDate==null? "12/6/20 ":onGoingOrdersModel.RidDate,style: AppFonts.monmgrey,),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Text("Time: ",style: TextStyle(fontSize: 14,color: AppColors.blueColor,fontWeight: FontWeight.bold),),
                      SizedBox(width: 4,),
                      Text(onGoingOrdersModel.RideTime ==null? "00:00 ":onGoingOrdersModel.RideTime,style: AppFonts.monmgrey,),
                    ],
                  ),
                ),
                RaisedButton(
                  onPressed: (){
                    setState(() {
                      FirebaseDatabase.instance.reference().child("Request").child(onGoingOrdersModel.RequestId).remove();
                    });
                  },
                  color: Colors.lightGreenAccent[700],
                  child: Text("Cancle Ride"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    //  side: BorderSide(color: Colors.red)
                  ),

                ),
              ],
            ),
            SizedBox(height: 8,)
          ],
        ),
      ),
    );
  }

  Widget OngoingBooking(PastOrdersModel pastOrdersModel){
    var size= MediaQuery.of(context).size;
    return Card(
      child: Container(
        height: 352,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            color: Colors.white
        ),
        child: Column(
          children: [
            SizedBox(height: 8,),
            RideStatus(pastOrdersModel),
            Container(
              height: 1,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                height: 0,
                thickness: 1,
                color: Colors.black38,
              ),
            ),
            SizedBox(height: 8,),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                      width: size.width*0.43,
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
                              Text(pastOrdersModel.acceptedByName==null?"Driver Name":pastOrdersModel.acceptedByName ,
                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
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
                    Expanded(
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
                                  pastOrdersModel.Serviceimage == null ? 'https://firebasestorage.googleapis.com/v0/b/norway-568bb.appspot.com/o/bike.png?alt=media&token=ad957b1d-74ee-4dde-b0ef-4b874b1b3ac6' : pastOrdersModel.Serviceimage,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              Text(pastOrdersModel.ServiceType==null?"Car":pastOrdersModel.ServiceType.toString(),style: TextStyle(fontSize: 12),),
                              SizedBox(height: 4,),
                              Text( pastOrdersModel.ServiceBudget==null?"200":pastOrdersModel.ServiceBudget.toString()+"\$" ,style: TextStyle(fontSize: 12),),
                            ],
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
                        width: size.width / 1.39,
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
                      width: size.width/1.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'To : ',
                            style: AppFonts.monmbold,
                          ),
                          Container(
                            width: size.width / 1.193,
                            height: 35,
                            child:
                            Text(
                              pastOrdersModel.ToAddress==null?"Hemliton Street, union Market USA":pastOrdersModel.ToAddress,
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
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: size.width / 1,
              height: size.height / 22,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TrackDriver(pastOrdersModel:pastOrdersModel)));
                    },
                    color: Colors.lightGreenAccent[700],
                    child: Text("Track Driver"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      //  side: BorderSide(color: Colors.red)
                    ),

                  ),
                  Visibility(
                    visible: pastOrdersModel.isPickedUp==false?true:false,
                    child: RaisedButton(
                        onPressed: (){
                          databaseReference
                              .child("journey_history")
                              .child(pastOrdersModel.RequestId)
                              .update({
                            'isJourneyCancelledbyCustomer': true,
                            'isJourneyCancelled': true,
                          });
                        },
                        color: Colors.red,
                        child: Text("Cancle Trip"),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          //  side: BorderSide(color: Colors.red)
                        )
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text("Duration: ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: AppColors.blueColor),),
                  SizedBox(width: 4,),
                  RichText(
                      text: TextSpan(
                          text:  pastOrdersModel.distance==null?"Distance":pastOrdersModel.distance ,

                          style: AppFonts.monmgrey,
                          children: <TextSpan>[
                            TextSpan(text:" ( ",style: TextStyle(fontSize: 12)),
                            TextSpan(
                                text:  pastOrdersModel.duration==null?"2 mins":pastOrdersModel.duration,
                                style: AppFonts.monrgrey),
                            TextSpan(text:" ) ",style: TextStyle(fontSize: 12)),
                          ])),
                  Spacer(),
                  Icon(Icons.message,size: 15,color: AppColors.blueColor,)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text("Price ",style: TextStyle(fontSize: 14,color: AppColors.blueColor,fontWeight: FontWeight.bold),),
                  SizedBox(width: 4,),
                  Text(pastOrdersModel.price==null?"200 \$":pastOrdersModel.price.toString()+"\$",style: AppFonts.monmgrey,),

                ],
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text("Date: ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: AppColors.blueColor),),
                      SizedBox(width: 4,),
                      Text(pastOrdersModel.RidDate==null?"12/6/20 ":pastOrdersModel.RidDate,style: AppFonts.monmgrey,),

                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text("Time: ",style: TextStyle(fontSize: 14,color: AppColors.blueColor,fontWeight: FontWeight.bold),),
                      SizedBox(width: 4,),
                      Text(pastOrdersModel.RideTime==null?"12:30 am ":pastOrdersModel.RideTime,style: AppFonts.monmgrey,),

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
  Widget RideStatus(PastOrdersModel pastOrdersModel){
    if(pastOrdersModel.isAccepted==true && pastOrdersModel.isPickedUp==false){
        return  Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              SizedBox(width: 10,),
              Icon(Icons.adjust,size: 15,color: Color(0xFF145c73)),
              SizedBox(width: 10,),
              Text("Your driver is the on way",style: TextStyle(fontSize: 16),)
            ],
          ),
        );
    }else if(pastOrdersModel.isPickedUp==true && pastOrdersModel.isJourneyEnded==false){
        return  Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              SizedBox(width: 10,),
              Icon(Icons.adjust,size: 15,color: Color(0xFF145c73)),
              SizedBox(width: 10,),
              Text("Your are on way to Destination",style: TextStyle(fontSize: 16),)
            ],
          ),
        );

    }else if(pastOrdersModel.isJourneyCancelledbyDriver==true && pastOrdersModel.isJourneyCancelled==true){
        return  Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              SizedBox(width: 10,),
              Icon(Icons.adjust,size: 15,color: Color(0xFF145c73)),
              SizedBox(width: 10,),
              Text("Driver Has Cancelled the Ride",style: TextStyle(fontSize: 16),)
            ],
          ),
        );
    }


  }
  Widget ReqRideStatus(){
    return  Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(width: 10,),
          Icon(Icons.adjust,size: 15,color: Color(0xFF145c73)),
          SizedBox(width: 10,),
          Text("Ride Has Been Sheduled..",style: TextStyle(fontSize: 16),)
        ],
      ),
    );
  }
}
