import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoder/model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:norwayfinalcustomer/Models/vehiclesmodels.dart';
import 'package:norwayfinalcustomer/Registration/Reviews.dart';
import 'package:norwayfinalcustomer/Registration/UserData.dart';
import 'package:norwayfinalcustomer/Saloon/Model/customDialogInput.dart';
import 'package:norwayfinalcustomer/car/Bottom%20Navigation.dart';
import 'package:norwayfinalcustomer/car/pages/carooption.dart';
import 'package:norwayfinalcustomer/foodModule/Screen/Foodmsg_view.dart';
import 'package:norwayfinalcustomer/foodModule/Screen/foodNewOrder/RidersDetails.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/Component/Color/color.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/Component/Style/style.dart';
import 'package:norwayfinalcustomer/place/placeItem.dart';
import 'package:norwayfinalcustomer/place/place_bloc.dart';
import 'package:http/http.dart' as http;

import '../../PaymentCardSelect.dart';

class Taxi_Map extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Taxi_Map> {
  bool btn=true;
  bool bottom=false;
  bool select=false;
  bool payment=false;
  FocusNode nodeFrom = FocusNode();
  FocusNode nodeTo = FocusNode();
  bool checkAutoFocus = false, inputFrom = false, inputTo = false;
  List<Map<String, dynamic>> dataFrom = new List<Map<String, dynamic>>();
  List<Map<String, dynamic>> dataTo = new List<Map<String, dynamic>>();
  var _addressFrom, _addressTo;
  var placeBloc = PlaceBloc();
  String valueFrom, valueTo;
  //Completer<GoogleMapController> _controller = Completer();
  var fromm, too, tolatt, tolongg, fromlatt, fromlongg;
  LatLng _fromLocation;
  LatLng _toLocation;
  static const LatLng _center = const LatLng(45.521563, -122.677433);
  bool checkPlatform = Platform.isIOS;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  Location _locationTracker = Location();
  GoogleMapController _controller;
  final Set<Polyline> polyline = {};
  StreamSubscription _locationSubscription;
  var current, destination;
  String distance, addFrom;
  String point;
  String duration;
  FirebaseAuth _auth = FirebaseAuth.instance;
  DatabaseReference userdataref;
  var DLtn, Dlng;
  String DriverId;
  bool _cancleFlage=false;
  final databaseReference = FirebaseDatabase.instance.reference();
  String Request_Id;
  DatabaseReference ServicesRef;
  List<VehicleModel> ServiceList;
  bool locstatus=true;
  bool searchbar=true;
  bool popflag = false;
  String DName;
  String ReqServiceImage;
  String RideDistance;
  String RideDuration;
  bool rideaccepted=false;
  int _currentIndexs = 0;
  String selectedServiceName = '';
  String selectimageservice;
  int selectedServiceBudget = 0;
  double priceAccToSelectedService;
  var Price, ServiceType;
  String paymentflag;
  MarkerId selectedMarker;
  int _markerIdCounter = 1;
  var selectTime = 'select date';
  bool sheduleflage=false;



  @override
  void initState() {
    showpool();
    ServiceList = new List();
    getCurrentLocation();
    getUserData();
    btn=true;
    bottom=false;
    select=false;
    payment=false;
    setState(() {
      ServiceSnapshot();
    });
    // TODO: implement initState
    super.initState();
  }
  void showpool(){
    FirebaseDatabase database = FirebaseDatabase.instance;
    database
        .reference()
        .child('DriverLatLong')
        .onValue
        .listen((event) {
      var snapshot = event.snapshot;
      if (snapshot.value != null) {
        int i=0;
        Map<String, dynamic> mapOfMaps = Map.from(snapshot.value);
        mapOfMaps.forEach((key, value) {
          var lat=snapshot.value['latitude'];
          var long=snapshot.value['longitude'];
          addpool(lat,long);
        });

      }
    });
  }
  void  addpool(var lat,var long) {
    final int markerCount = markers.length;
    if (markerCount == 12) {
      return;
    }
    final String markerIdVal = 'marker_id_$_markerIdCounter';
    _markerIdCounter++;
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
      icon: checkPlatform
              ? BitmapDescriptor.fromAsset("assets/truck-2.png")
              : BitmapDescriptor.fromAsset("assets/truck-2.png"),
          draggable: false,
          rotation: 0.0,
          consumeTapEvents: true,
      markerId: markerId,
      position: LatLng(
        lat+ sin(_markerIdCounter * pi / 6.0) / 20.0,
        long + cos(_markerIdCounter * pi / 6.0) / 20.0,
      ),
      infoWindow: InfoWindow(title: markerIdVal, snippet: '*'),
      onTap: () {

      },
      onDragEnd: (LatLng position) {

      },
    );

    setState(() {
      markers[markerId] = marker;
    });
  }
  Future<void> ServiceSnapshot() {
    final FirebaseDatabase database = FirebaseDatabase.instance;
    ServicesRef = database.reference().child('Vehicles');
    ServicesRef.once().then((DataSnapshot snapshot) {
      //subscriptiontList.clear();
      Map<String, dynamic> mapOfMaps = Map.from(snapshot.value);
      mapOfMaps.values.forEach((value) {
        setState(() {
          ServiceList.add(VehicleModel(
            value['budget'],
            value["pic"],
            value["title"],
          ));
          setState(() {
            list();
          });
        });
      });
    });
  }
  Widget list() {
    return SizedBox(
      height: 60,
      width: 400,
      child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: ServiceList.length,
          itemBuilder: (_, index) {
            return cartypes(ServiceList[index],index);
          }),
    );
  }


  Future<void> getUserData() async {
    final  user = await _auth.currentUser;
    final uid = user.uid;
    FirebaseDatabase database = FirebaseDatabase.instance;
    database.setPersistenceEnabled(true);
    database.setPersistenceCacheSizeBytes(10000000);
    database.reference().child('Customer').child(uid).onValue.listen((event) {
      final FirebaseDatabase database = FirebaseDatabase.instance;
      userdataref = database.reference().child('Customer').child(uid);
      userdataref.once().then((DataSnapshot snapshot) {
        UserData.UserId = snapshot.value['uid'];
        UserData.Name = snapshot.value['Name'];

      });
    });
  }
  setPolylines(LatLng A, LatLng B, bool show) async {
    //flag = false;
    String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${A.latitude},${A.longitude}&destination=${B.latitude},${B.longitude}&key=AIzaSyBR7rrSUi4o118-vGLhDI_f6buJOnZr900";
    http.Response response = await http.get(url);
    Map values = jsonDecode(response.body);
    point = values["routes"][0]["overview_polyline"]["points"];
    distance = values["routes"][0]["legs"][0]["distance"]["text"];
    duration = values["routes"][0]["legs"][0]["duration"]["text"];
    setState(() {
      polyline.add(Polyline(
          polylineId: PolylineId('route1'),
          visible: true,
          points: convertToLatLng(decodePoly(point)),
          width: 6,
          color: Colors.green,
          startCap: Cap.roundCap,
          endCap: Cap.buttCap));


      setState(() {
        if (show == true) {
          addMakers();
        } else {
          addMaker2(A,B);
        }
      });

    });
    return values["routes"][0]["overview_polyline"]["points"];
  }


  static List<LatLng> convertToLatLng(List points) {
    List<LatLng> result = <LatLng>[];
    for (int i = 0; i < points.length; i++) {
      if (i % 2 != 0) {
        result.add(LatLng(points[i - 1], points[i]));
      }
    }
    return result;
  }

  static List decodePoly(String poly) {
    var list = poly.codeUnits;
    var lList = new List();
    int index = 0;
    int len = poly.length;
    int c = 0;
    // repeating until all attributes are decoded
    do {
      var shift = 0;
      int result = 0;

      // for decoding value of one attribute
      do {
        c = list[index] - 63;
        result |= (c & 0x1F) << (shift * 5);
        index++;
        shift++;
      } while (c >= 32);
      /* if value is negative then bitwise not the value */
      if (result & 1 == 1) {
        result = ~result;
      }
      var result1 = (result >> 1) * 0.00001;
      lList.add(result1);
    } while (index < len);

    /*adding to previous value as done in encoding */
    for (var i = 2; i < lList.length; i++) lList[i] += lList[i - 2];

    print(lList.toString());

    return lList;
  }

  addMakers() {
    checkPlatform ? print('ios') : print("android");
    final MarkerId markerIdFrom = MarkerId("from_address");
    final MarkerId markerIdTo = MarkerId("to_address");
    // var _dataFrom = dataFrom;
    var _dataTo = dataTo;

    final Marker marker = Marker(
      markerId: markerIdFrom,
      position: LatLng(_fromLocation.latitude, _fromLocation.longitude),
      // position: LatLng(from_l.latitude, from_l.longitude),
      infoWindow: InfoWindow(title: "Current"),
      icon: checkPlatform
      // ? BitmapDescriptor.fromAsset("assets/currentmarker.png")
      // : BitmapDescriptor.fromAsset("assets/currentmarker.png"),
          ? BitmapDescriptor.defaultMarker
          : BitmapDescriptor.defaultMarker,
      onTap: () {
        // _onMarkerTapped(markerId);
      },
    );

    final Marker markerTo = Marker(
        markerId: markerIdTo,
        //position: LatLng(to_l.latitude, to_l.longitude),
        position: LatLng(_dataTo[0]['lat'], _dataTo[0]['long']),
        infoWindow: InfoWindow(
            title: _dataTo[0]['name'], snippet: _dataTo[0]['address']),
        icon: checkPlatform
        // ? BitmapDescriptor.fromAsset("assets/destination.png")
        // : BitmapDescriptor.fromAsset("assets/destination.png"),
            ? BitmapDescriptor.defaultMarker
            : BitmapDescriptor.defaultMarker);

    setState(() {
      markers[markerIdFrom] = marker;
      markers[markerIdTo] = markerTo;
    });
  }

  addMaker2(var from_l, to_l) {
    checkPlatform ? print('ios') : print("android");
    final MarkerId markerIdFrom = MarkerId("from_address");
    final MarkerId markerIdTo = MarkerId("to_address");
    // var _dataFrom = dataFrom;
    var _dataTo = dataTo;

    final Marker marker = Marker(
      markerId: markerIdFrom,
      // position: LatLng(_fromLocation.latitude, _fromLocation.longitude),
      position: LatLng(from_l.latitude, from_l.longitude),
      infoWindow: InfoWindow(title: "Current"),
      icon: checkPlatform
      // ? BitmapDescriptor.fromAsset("assets/currentmarker.png")
      // : BitmapDescriptor.fromAsset("assets/currentmarker.png"),
          ? BitmapDescriptor.defaultMarker
          : BitmapDescriptor.defaultMarker,
      onTap: () {
        // _onMarkerTapped(markerId);
      },
    );

    final Marker markerTo = Marker(
        markerId: markerIdTo,
        position: LatLng(to_l.latitude, to_l.longitude),
        //  position: LatLng(_dataTo[0]['lat'], _dataTo[0]['long']),
        infoWindow: InfoWindow(
            title: _dataTo[0]['name'], snippet: _dataTo[0]['address']),
        icon: checkPlatform
            ? BitmapDescriptor.fromAsset("assets/truck-2.png")
            : BitmapDescriptor.fromAsset("assets/truck-2.png")
      // ? BitmapDescriptor.defaultMarker
      // : BitmapDescriptor.defaultMarker
    );

    setState(() {
      markers[markerIdFrom] = marker;
      markers[markerIdTo] = markerTo;
    });
  }
  void updateMarkerAndCircle(LocationData newLocalData) {
    this.setState(() {
      checkPlatform ? print('ios') : print("android");
      final MarkerId markerIdFrom = MarkerId("My Location");
      final Marker marker = Marker(
        markerId: markerIdFrom,
        //position: LatLng(_fromLocation.latitude, _fromLocation.longitude),
        position: LatLng(newLocalData.latitude, newLocalData.longitude),
        infoWindow: InfoWindow(title: "Current"),
        icon: checkPlatform
        // ? BitmapDescriptor.fromAsset("assets/currentmarker.png")
        // : BitmapDescriptor.fromAsset("assets/currentmarker.png"),
            ? BitmapDescriptor.defaultMarker
            : BitmapDescriptor.defaultMarker,
      );
      setState(() {
        markers[markerIdFrom] = marker;
      });

    });
  }

  void getCurrentLocation() async {
    try {
     // Uint8List imageData = await getMarker();
      var location = await _locationTracker.getLocation();

      updateMarkerAndCircle(location);
      getLocationName(location.latitude, location.longitude);
      current=new LatLng(location.latitude, location.longitude);
      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }
        _locationSubscription =
            _locationTracker.onLocationChanged().listen((newLocalData) {

              if (_controller != null) {
                if(locstatus){
                _controller.animateCamera(CameraUpdate.newCameraPosition(
                    new CameraPosition(
                        bearing: 192.8334901395799,
                        target: LatLng(newLocalData.latitude, newLocalData.longitude),
                        tilt: 0,
                        zoom: 18.00)));
                updateMarkerAndCircle(location);
                setState(() {
                  locstatus=false;
                });
              }
              }
            });



    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }

  }
  void getLocationName(double lat, double lng) async {
    final coordinates = new Coordinates(lat, lng);
    var addresses =
    await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print("${first.featureName} : ${first.addressLine}");
    addFrom = first.addressLine;

    setState(() {
      _addressFrom = TextEditingController(text:addFrom);
      print(addFrom);
    });

  }
  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 10.4746,
  );

  Widget Popup(){
    showDialog(
      barrierDismissible: true,
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Thank You For Booking With Us"),
            actions:[
              FlatButton(
                onPressed: (){
                  Navigator.of(context).pop();
                  setState(() {
                    bottom=false;
                  });
                },
                child: Text("OK"),
              )
            ],
          );
        }
    );
  }
  _onChangeds(VehicleModel vehicleModel,int i) {
    setState(() {
      _currentIndexs=i;
    });
    setState(() {
      selectedServiceName=vehicleModel.title;
      selectedServiceBudget=vehicleModel.budget;
      selectimageservice=vehicleModel.image;
      var d = distance.split(" ");
      var s = d[0];
      var Distance =  double.parse(s);
      priceAccToSelectedService=this.selectedServiceBudget+2*Distance;
    });

  }

  String txt='';
  Widget cartypes(VehicleModel vehicleModel,int index){
    return InkWell(
      onTap: (){
        _onChangeds(vehicleModel,index);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          // height: 60,width: 120,
          decoration: BoxDecoration(
              color: index==_currentIndexs? Colors.green[500]:Colors.white,
              borderRadius: BorderRadius.circular(10)
          ),
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
                      vehicleModel.image == null ? 'https://firebasestorage.googleapis.com/v0/b/norway-568bb.appspot.com/o/bike.png?alt=media&token=ad957b1d-74ee-4dde-b0ef-4b874b1b3ac6' :  vehicleModel.image,
                      // _selectedIndex !=null && _selectedIndex==index ? 'https://firebasestorage.googleapis.com/v0/b/serviceappsajid.appspot.com/o/images%2Fsalectimage.png?alt=media&token=414b91bb-2904-4042-9d68-96175f355293' : ServiceList[index].image,
                      // colors: _selectedIndex != null && _selectedIndex == index  ? [Colors.grey,Colors.grey]  : [Colors.white ,Colors.white ]  ,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5,),
              Text(vehicleModel.title==null?"vehicles":vehicleModel.title,style: TextStyle(color: index==_currentIndexs? Colors.white:Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
              SizedBox(width: 5,),
              Text(vehicleModel.budget.toString()==null?"vehicles":vehicleModel.budget.toString(),style: TextStyle(color: index==_currentIndexs? Colors.white:Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
              SizedBox(width: 10,),
              Divider(thickness: 5,color: Colors.black,)
            ],
          ),
        ),
      ),
    );
  }
  final format = DateFormat("yyyy-MM-dd HH:mm");
  TimeOfDay selectedTime =TimeOfDay.now();
  String selectDate = 'select time';
  var comparetime ;


  String currentValue;
  Widget _getUpperLayer() {
    return Visibility(
      visible: bottom,
      child: DraggableScrollableSheet(

        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        builder: (BuildContext context, ScrollController scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft:  Radius.circular(30),
                  topRight:  Radius.circular(30),
                )
              ),
              height: MediaQuery.of(context).size.height/1.75,

              child: Container(
                height: MediaQuery.of(context).size.height/1.75,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Center(child: Icon(Icons.remove,size: 50,)),
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(left:8.0),
                            child: Text("Select Your Ride",style: TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)
                        ),
                        Spacer(),
                        InkWell(
                            onTap: (){
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) => PaymentCardDetails(getSelectedpayment:
                              getSelectedpayment)));
                              },
                          child: Container(
                            child: Text('Select Payment Type', style: TextStyle(fontSize: 12,color: AppColors.lightgreenColor),),
                          ),
                        ),
                        SizedBox(width: 20,),
                      ],
                    ),
                    SizedBox(height: 15,),
                    list(),
                    SizedBox(height: 10,),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('Payment Info',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black54),)
                          ,
                          SizedBox(height: 12,),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                Text('Payment Type :',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                Spacer(),
                                Text('Cash',style: TextStyle(fontSize: 12,),),
                              ],
                            ),
                          ),
                          SizedBox(height: 2.5,),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                Text('Km/hr :',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                Spacer(),
                                Text(distance==null?"20 km":distance,style: TextStyle(fontSize: 12,),),
                              ],
                            ),
                          ),
                          SizedBox(height: 2.5,),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                Text('Total :',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                Spacer(),
                                Text(priceAccToSelectedService==null?"Price":priceAccToSelectedService.toString() ,
                                  style: TextStyle(fontSize: 12,),),
                              ],
                            ),
                          ),
                          SizedBox(height: 2.5,),
                          Visibility(
                            visible: sheduleflage,
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  child: Row(
                                    children: [
                                      Text('Date :',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                      Spacer(),
                                      GestureDetector(
                                          onTap: () async {
                                            DatePicker.showDatePicker(context,
                                                showTitleActions: true,
                                                minTime: DateTime.now(),
                                                maxTime: DateTime(2050, 12, 1),
                                                theme: DatePickerTheme(
                                                    headerColor: Colors.yellow,
                                                    backgroundColor: AppColors.lightgreenColor,
                                                    itemStyle: TextStyle(
                                                        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                                                    doneStyle: TextStyle(color: Colors.white, fontSize: 16)),
                                                onChanged: (date) {
                                                  print('change $date in time zone ' + date.timeZoneOffset.inHours.toString());
                                                  setState((){
                                                    selectTime = "${date.toLocal()}".split(' ')[0];
                                                  });
                                                }, onConfirm: (date) {
                                                  print('confirm $date');
                                                  setState(() {
                                                    selectTime = "${date.toLocal()}".split(' ')[0];
                                                  });
                                                }, currentTime: DateTime.now(), locale: LocaleType.en);
                                          },
                                          child: Text(selectTime,
                                            style: TextStyle(fontSize: 12,color: AppColors.lightgreenColor),)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 2.5,),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  child: Row(
                                    children: [
                                      Text('Time :',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                      Spacer(),
                                      GestureDetector(
                                          onTap: () async {
                                            final TimeOfDay pickedS = await showTimePicker(
                                                context: context,
                                                initialTime: selectedTime, builder: (BuildContext context, Widget child) {
                                              return MediaQuery(
                                                data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
                                                child: child,

                                              );});

                                            if (pickedS != null && pickedS != selectedTime ){
                                              setState(() {

                                                selectedTime = pickedS;
                                                comparetime = pickedS;
                                                selectDate = selectedTime.format(context).toString();

                                              });
                                            }else{
                                              setState(() {
                                                selectDate = selectedTime.format(context).toString();
                                              });
                                            }
                                          },
                                          child: Text(selectDate,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color:AppColors.lightgreenColor,
                                            ),)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 2.5,),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    InkWell(

                      child: Container(
                          width: MediaQuery.of(context).size.width/1.75,
                          height: MediaQuery.of(context).size.width/8.75,
                          decoration: BoxDecoration(
                              color: Colors.green[500],
                              borderRadius: BorderRadius.circular(50.0)
                          ),
                          alignment: Alignment.center,
                          child:Text('Ready To Go',
                            style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),
                          )
                      ),
                      onTap: (){
                        setState(() {
                          btn=false;
                          select=false;
                          payment=true;
                          if(selectedServiceBudget==0 && selectTime=='select date' && selectDate == 'select time' ){
                            Fluttertoast.showToast(
                                msg: "Please Select Payment Type or Vehicle Type or Date/Time",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 3,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }else{
                            SendRequest();
                            Popup();
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          );

        },
      ),
    );
  }
void  getSelectedpayment(String paymentflag){
    setState(() {
      this.paymentflag=paymentflag;

    });

}

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Ride Booking",
            style: TextStyle(color: AppColors.black),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back,color: Colors.black, ),
            // onPressed: () => Navigator.pop(context),
            color: Colors.white,
          ),
        ),
      bottomNavigationBar: Visibility(
        visible:btn,
        child: InkWell(
          child: Container(
            color: Colors.green[500],
            width: MediaQuery.of(context).size.width/9.75,
            height: MediaQuery.of(context).size.width/6.75,
            alignment: Alignment.center,
            child:Text('Book Now',
              style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),

            )
          ),
          onTap: (){
            setState(() {
              if(valueTo==null){
                Fluttertoast.showToast(
                    msg: "Please Enter Destination Location",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 3,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }else{
                PopupShedule();
              }
            });
          },
        ),
      ),
        body: Container(
          child: Stack(
              children: [
                GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: initialLocation,
                  markers: Set<Marker>.of(markers.values),
                  onMapCreated: (controller){
                    setState(() {
                      _controller = controller;
                    });
                  },
                  //  markers: Set<Marker>.of(markers.values),
                  polylines: polyline,
                ),
                Visibility(
                  visible: searchbar,
                  child: SingleChildScrollView(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.0,

                        child: Column(
                          children: <Widget>[
                            Card(
                              child: Container(
                                width: MediaQuery.of(context).size.width / 1.0,
                               // margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                color:Colors.white,
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    new Expanded(
                                      flex: 1,
                                      child: new Column(
                                        children: <Widget>[
                                          new Icon(
                                            Icons.my_location,
                                            size: 20.0,
                                            color: Colors.blue,
                                          ),
                                          new Icon(
                                            Icons.more_vert,
                                            size: 20.0,
                                            color: Colors.grey,
                                          ),
                                          new Icon(
                                            Icons.location_on,
                                            size: 20.0,
                                            color: Colors.red,
                                          )
                                        ],
                                      ),
                                    ),
                                    new Expanded(
                                      flex: 5,
                                      child: Form(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.max,
                                            children: <Widget>[
                                              new Container(
                                                height: 50.0,
                                                width: MediaQuery.of(context).size.width -
                                                    50,
                                                color: Colors.white,
                                                child: new Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    TextField(
                                                      style: TextStyle(fontSize: 15),
                                                      decoration:
                                                      InputDecoration.collapsed(
                                                        fillColor:Colors.white,
                                                        hintStyle: TextStyle(
                                                            color: Colors.black),
                                                        hintText:  "Enter the PickUp Location",
                                                      ),
                                                      autofocus: false,
                                                      focusNode: nodeFrom,
                                                      controller: _addressFrom,
                                                      onChanged: (String value) {
                                                        placeBloc.searchPlace(value);
                                                      },
                                                      onTap: () {
                                                        setState(() {
                                                          inputFrom = true;
                                                          inputTo = false;
                                                          print(inputTo);
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context).size.width -
                                                    50.0,
                                                height: 1.0,
                                                color: Colors.grey.withOpacity(0.4),
                                              ),
                                              new Container(
                                                height: 50.0,
                                                // width: MediaQuery.of(context).size.width,
                                                color: Colors.white,
                                                child: new Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    TextField(
                                                      style:TextStyle(fontSize: 15),
                                                      decoration:
                                                      InputDecoration.collapsed(
                                                        fillColor: Colors.white,
                                                        hintStyle: TextStyle(
                                                            color: Colors.black),
                                                        hintText: 'Enter the Dropoff Location',
                                                      ),
                                                      focusNode: nodeTo,
                                                      controller: _addressTo,
                                                      onChanged: (String value) {
                                                        placeBloc.searchPlace(value);
                                                      },
                                                      onTap: () {
                                                        setState(() {
                                                          inputTo = true;
                                                          inputFrom = false;
                                                          print(inputTo);
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            inputTo != true
                                ? Container(
                              color: Colors.white,
                              child: StreamBuilder(
                                  stream: placeBloc.placeStream,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data == "start") {
                                        return Center(
                                          child: CupertinoActivityIndicator(),
                                        );
                                      }
                                      List<PlaceItemRes> places = snapshot.data;
                                      return ListView.separated(
                                        shrinkWrap: true,
                                        itemCount: places.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title: Text(places
                                                .elementAt(index)
                                                .name
                                                .runtimeType ==
                                                String
                                                ? places.elementAt(index).name
                                                : ""),
                                            subtitle: Text(places
                                                .elementAt(index)
                                                .address
                                                .runtimeType ==
                                                String
                                                ? places
                                                .elementAt(index)
                                                .address
                                                : ""),
                                            onTap: () {
                                              dataFrom.clear();
                                              Map<String, dynamic> value = {
                                                "name": places
                                                    .elementAt(index)
                                                    .name,
                                                "address": places
                                                    .elementAt(index)
                                                    .address,
                                                "lat":
                                                places.elementAt(index).lat,
                                                "long":
                                                places.elementAt(index).lng
                                              };
                                              print('dataFrom: ' +
                                                  value.toString());
                                              setState(() {
                                                valueFrom = places
                                                    .elementAt(index)
                                                    .name
                                                    .toString();
                                                _addressFrom =
                                                    TextEditingController(
                                                        text: valueFrom);
                                                inputTo = true;
                                                FocusScope.of(context)
                                                    .requestFocus(nodeTo);
                                                //new address from
                                                dataFrom.add(value);
                                                print(dataFrom);
                                                places.clear();
                                              });
                                            },
                                          );
                                        },
                                        separatorBuilder: (context, index) =>
                                            Divider(
                                              height: 1,
                                              color: Color(0xfff5f5f5),
                                            ),
                                      );
                                    } else {
                                      return Container();
                                    }
                                  }),
                            )
                                : Container(
                              color: Colors.white,
                              child: StreamBuilder(
                                  stream: placeBloc.placeStream,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data == "start") {
                                        return Center(
                                          child: CupertinoActivityIndicator(),
                                        );
                                      }
                                      List<PlaceItemRes> places = snapshot.data;
                                      return ListView.separated(
                                        shrinkWrap: true,
                                        itemCount: places.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title: Text(places
                                                .elementAt(index)
                                                .name
                                                .runtimeType ==
                                                String
                                                ? places.elementAt(index).name
                                                : ""),
                                            subtitle: Text(places
                                                .elementAt(index)
                                                .address
                                                .runtimeType ==
                                                String
                                                ? places
                                                .elementAt(index)
                                                .address
                                                : ""),
                                            onTap: () {
                                              dataTo.clear();
                                              Map<String, dynamic> value = {
                                                "name": places
                                                    .elementAt(index)
                                                    .name,
                                                "address": places
                                                    .elementAt(index)
                                                    .address,
                                                "lat":
                                                places.elementAt(index).lat,
                                                "long":
                                                places.elementAt(index).lng
                                              };
                                              print('dataTo: ' +
                                                  value.toString());
                                              setState(() {
                                                valueTo = places
                                                    .elementAt(index)
                                                    .name
                                                    .toString();
                                                _addressTo =
                                                    TextEditingController(
                                                        text: places
                                                            .elementAt(index)
                                                            .name
                                                            .toString());
                                                FocusScope.of(context)
                                                    .requestFocus(
                                                    new FocusNode());
                                                dataTo.add(value);
                                                print(dataTo);
                                                places.clear();
                                                //directions

                                                DrawRoute();
                                              });
                                            },
                                          );
                                        },
                                        separatorBuilder: (context, index) =>
                                            Divider(
                                              height: 1,
                                              color: Color(0xfff5f5f5),
                                            ),
                                      );
                                    } else {
                                      return Container();
                                    }
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height:MediaQuery.of(context).size.height/1.8,
                      child: _getUpperLayer()),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 70),
                      child: Booking()),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      _showImagedialog();
                    },
                    child: Visibility(
                      visible:_cancleFlage,
                      child: Container(
                        height: 60,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: AppColors.blueColor,
                        ),
                        child: Center(
                            child: Text(
                              'Cancle Ride',
                              style: AppFonts.monmwhit16,
                            )),
                      ),
                    ),
                  ),
                ),
                // Container(
                //   color: Colors.white,
                //   height: MediaQuery.of(context).size.height/4,
                //   child: Stack(
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.all(11.0),
                //         child: Align(
                //           alignment: Alignment.topLeft,
                //           child: InkWell(child: Icon(Icons.arrow_back,color: Colors.black,),
                //             onTap: (){
                //               Navigator.pop(context);
                //             },
                //           ),
                //         ),
                //       ),
                //
                //
                //       // Positioned(
                //       //     top: 40,
                //       //     left: 40,
                //       //     child:
                //       //         Container(
                //       //           width: MediaQuery.of(context).size.width/1.2,
                //       //           child: TextFormField(
                //       //             decoration: InputDecoration(
                //       //                 icon: Icon(Icons.location_on,color: Colors.green,size: 20,),
                //       //                 border: InputBorder.none,
                //       //                 hintText: 'Enter the PickUp Location',
                //       //                 hintStyle: TextStyle(fontSize: 15)
                //       //             ),
                //       //           ),
                //       //         ),
                //       //
                //       //
                //       // ),
                //       // Positioned(
                //       //   top: 80,
                //       //   left: 40,
                //       //   child:
                //       //   Container(
                //       //     width: MediaQuery.of(context).size.width/1.2,
                //       //     child: TextFormField(
                //       //       decoration: InputDecoration(
                //       //           icon: Icon(Icons.pin_drop,color: Colors.green,size: 20,),
                //       //           border: InputBorder.none,
                //       //           hintText: 'Enter the Dropoff Location',
                //       //           hintStyle: TextStyle(fontSize: 15)
                //       //       ),
                //       //     ),
                //       //   ),
                //       //
                //       //
                //       // ),
                //     ],
                //   ),
                // ),
              ]

          ),
        ),

      ),
    );
  }
  Widget PopupShedule(){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Do You Want To Shedule your Ride"),
            actions:[
              FlatButton(
                onPressed: (){
                  setState(() {
                    sheduleflage=true;
                    Navigator.pop(context);
                    btn=false;
                    bottom=true;

                  });
                },
                child: Text("Yes"),
              ),
              FlatButton(
                onPressed: (){
                  setState(() {
                    sheduleflage=false;
                    Navigator.pop(context);
                    btn=false;
                    bottom=true;
                  });

                },
                child: Text("No"),
              ),
            ],
          );
        }
    );
  }
  void onRideCencle(){
    //  FirebaseDatabase.instance.reference().child("journey_history").child(Request_Id).remove();
    setState(() {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => CarOption()));
    });
  }
  void _showImagedialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24),
                  topLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                  bottomLeft: Radius.circular(24))),
          actions: <Widget>[
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding:
                    EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20),
                    child: Text( "Are you sure cencle the ride?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),

                  Padding(
                    padding:
                    EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: InkWell(
                        onTap: () {
                          databaseReference
                              .child("journey_history")
                              .child(Request_Id)
                              .update({
                            'isJourneyCancelledbyCustomer': true,
                            'isJourneyCancelled': true,
                          });
                          onRideCencle();
                        },
                        child: Center(
                            child: new Text("Yes",
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
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(
                          color:Colors.green,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Center(
                            child: new Text("No",
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
            )
          ],
        );
      },
    );
  }

  void DrawRoute() {
    if (dataFrom.length == 0) {
      too = dataTo[0]['address'];
      tolatt = dataTo[0]['lat'];
      tolongg = dataTo[0]['long'];
      _fromLocation = current;
      _toLocation = LatLng(dataTo[0]['lat'], dataTo[0]['long']);

      setState(() {
        setPolylines(_fromLocation, _toLocation, true);
      });
    } else {
      fromm = dataFrom[0]['name'];
      fromlatt = dataFrom[0]['lat'];
      fromlongg = dataFrom[0]['long'];
      _fromLocation = LatLng(dataFrom[0]['lat'], dataFrom[0]['long']);
      _toLocation = LatLng(dataTo[0]['lat'], dataTo[0]['long']);

      setState(() {
        setPolylines(_fromLocation, _toLocation, true);
      });
    }
  }
  Future<void> SendRequest() {
    if(sheduleflage==false){
      DateTime now = DateTime.now();
      DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formatted = formatter.format(now);
      dynamic currentTime = DateFormat.jm().format(DateTime.now());
      setState(() {
        selectDate=currentTime;
        selectTime=formatted;
      });
    }
    final User user = _auth.currentUser;
    Map<String, Object> locMap = new HashMap();
    locMap['CustomerId'] = user.uid;
    locMap['CustomerName'] = UserData.Name;
     locMap['ServiceType'] = selectedServiceName;
     locMap['ServiceBudget'] = selectedServiceBudget;
     locMap['Serviceimage']=selectimageservice;
    locMap['FromLatitude'] = _fromLocation.latitude;
    locMap['FromLongitude'] = _fromLocation.longitude;
    locMap['FromAddress'] = addFrom.toString();
    locMap['ToLatitude'] = tolatt;
    locMap['ToLongitude'] = tolongg;
    locMap['ToAddress'] = too;
    locMap['isAccepted'] = false;
    locMap['isJourneyStarted'] = false;
    locMap['isPickedUp'] = false;
    locMap['isJourneyEnded'] = false;
    locMap['isJourneyCancelled'] = false;
    locMap['acceptedByID'] = null;
    locMap['acceptedByName'] = null;
    locMap['distance'] = distance;
    locMap['duration'] = duration;
    var kk = FirebaseDatabase.instance.reference().child("Request").push().key;
    locMap['RequestId'] = kk;
    locMap['Price']=priceAccToSelectedService;
    locMap['RideDate']=selectTime;
    locMap['RideTime']=selectDate;
    locMap['compareTime']=comparetime.toString();
    locMap['isShedule']=sheduleflage;

    FirebaseDatabase.instance
        .reference()
        .child("Request")
        .child(kk)
        .set(locMap);
    if(sheduleflage==false){
      Fluttertoast.showToast(
          msg: "Your Request has been sent",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      dialogLoadingRequest(kk);
    }else if(sheduleflage==true){
      Fluttertoast.showToast(
          msg: "Your Ride has been Shdedule you can see in Ongoing Orders.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
     setState((){
       Navigator.push(
           context,
           MaterialPageRoute(
           builder: (context) => CarNavigation()));
     });
    }

    // showModalBottomSheet(
    //     enableDrag: false,
    //     isScrollControlled: true,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.only(
    //           topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
    //     ),
    //     context: context,
    //     isDismissible: false,
    //     builder: (BuildContext bc) {
    //       return dialogLoadingRequest(kk);
    //     });


  }
  dialogLoadingRequest(String kk){
    Future.delayed(const Duration(milliseconds: 5000),(){
      setState((){
        SetRequestAccept(kk);
      });
    });
    return CustomDialogInput(
      title:  "Waiting for Request Acceptance",
      buttonName:"Cancel",
      body: '',
      onCancelled: () {
        databaseReference
            .child("CenceledRidesbyCustomers")
            .child(Request_Id)
            .update({
          'isCencled': true,
          'CencledbyId': UserData.UserId
        });
        FirebaseDatabase.instance.reference().child("Request").child(Request_Id).remove();
        setState(() {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (_) => CarOption()));
        });
      },
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
  Future<void> SetRequestAccept(String RequestId) async{
   // final prefs = await SharedPreferences.getInstance();
    FirebaseDatabase database = FirebaseDatabase.instance;
    database
        .reference()
        .child('journey_history')
        .child(RequestId)
        .onValue
        .listen((event){
      var snapshot = event.snapshot;
      if (snapshot.value != null) {
        // if(hasBeenAccepted==true){
        //   if(snapshot.value['isJourneyCancelledbyDriver']==true){
        //     _showCancledialog();
        //   }
        // }
        // setState(() {
        //   if(popflag==false){
        //     Navigator.of(context).pop();
        //     searchbarflag = false;
        //     popflag=true;
        //   }
        // });
        var isAccepted = snapshot.value["isAccepted"];
        if (isAccepted == true) {
          if(snapshot.value['isJourneyCancelledbyDriver']==true){
            _showCancledialog();
          }
          setState(() {
            if(popflag==false){
              Navigator.of(context).pop();
              searchbar=false;
              popflag=true;
              bottom=false;
              _cancleFlage=true;
            }
          });
          rideaccepted=true;
          // prefs.setString("RideID", RequestId );
          // Dpic = snapshot.value['Profile Picture'];
          DName = snapshot.value['acceptedByName'];
          RideDistance = snapshot.value['distance'];
          RideDuration = snapshot.value['duration'];
          ReqServiceImage=snapshot.value['Serviceimage'];
          ServiceType = snapshot.value['ServiceType'];
         DriverId = snapshot.value['acceptedByID'];
          // ServicePrice = snapshot.value['ServiceBudget'];
           Price=snapshot.value['Price'];
          trackDriver(DriverId);
          Request_Id=RequestId;
          //Ratingsnapshot();
          setState(() {
            onFinishRide(RequestId);
          });

        }
      }
    });
  }
  void _showCancledialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24),
                  topLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                  bottomLeft: Radius.circular(24))),
          actions: <Widget>[
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding:
                    EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20),
                    child: Text( "Driver Has Cencled the Request..!" ,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(
                          color:Colors.green,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(builder: (_) => CarOption()));
                        },
                        child: Center(
                            child: new Text( "Ok..!",
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
            )
          ],
        );
      },
    );
  }

  Future<void> onFinishRide(String reqid) async {
    // final prefs = await SharedPreferences.getInstance();
    // String reqid= prefs.getString('RideID');
    FirebaseDatabase database = FirebaseDatabase.instance;
    database
        .reference()
        .child('journey_history')
        .child(reqid)
        .onValue
        .listen((event) {
      var snapshot = event.snapshot;
      if (snapshot.value != null) {
        var rideend=snapshot.value['isJourneyEnded'];
        if(rideend == true){
          // setState(() {
          //   Navigator.of(context).pop();
          // });
          setState(() {
            Fluttertoast.showToast(
                msg:  "Ride Has Been Finished",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Reviews(driverid:DriverId)));
            });




            // _showRatingDialog();


        }
      }
    });
  }


  Future<void> trackDriver(String DrivertId) {
    polyline.clear();
    markers.clear();
    FirebaseDatabase database = FirebaseDatabase.instance;
    database
        .reference()
        .child('DriverLatLong')
        .child(DrivertId)
        .onValue
        .listen((event) {
      var snapshot = event.snapshot;
      if (snapshot.value != null) {
        DLtn = snapshot.value['latitude'];
        Dlng = snapshot.value['longitude'];

        LatLng DriverLtLf = new LatLng(DLtn, Dlng);
        setState(() {
          setPolylines(current, DriverLtLf, false);
        });
        setState(() {
          if (_controller != null) {
            _controller.animateCamera(CameraUpdate.newCameraPosition(
                new CameraPosition(
                    bearing: 192.8334901395799,
                    target: LatLng(DLtn, Dlng),
                    tilt: 0,
                    zoom: 18.00)));
          }
        });
      }
    });
  }
  Widget Booking(){
    var size= MediaQuery.of(context).size;
    return Visibility(
      visible: rideaccepted,
      child: Container(
        height: 175,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white
        ),
        child: Column(
          children: [
            SizedBox(height: 8,),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Icon(Icons.gps_fixed,size: 15,color: Color(0xFF145c73)),
                  SizedBox(width: 10,),
                  Text("Your driver is the on way",style: TextStyle(fontSize: 16),)
                ],
              ),
            ),
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
                          Container(
                            width: 70,
                            height: 70,
                            child: Image.asset("assets/dp.png"),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(  DName == null ? "DriverName" : DName,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
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
                    Spacer(),
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
                                  ReqServiceImage == null ? 'https://firebasestorage.googleapis.com/v0/b/norway-568bb.appspot.com/o/bike.png?alt=media&token=ad957b1d-74ee-4dde-b0ef-4b874b1b3ac6' : ReqServiceImage,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              Text(ServiceType==null?"ServiceType":ServiceType,style: TextStyle(fontSize: 12),),
                              SizedBox(height: 4,),
                              Text(Price==null? "200": Price.toString() ,style: TextStyle(fontSize: 12),),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )
            ),
            SizedBox(height: 15,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text("Duration: ",style: TextStyle(fontSize: 14),),
                  SizedBox(width: 4,),
                  RichText(
                      text: TextSpan(
                          text: RideDistance == null ? "Distance" : RideDistance,

                          style: AppFonts.monmblue,
                          children: <TextSpan>[
                            TextSpan(text:" ( ",style: TextStyle(fontSize: 12)),
                            TextSpan(
                                text:  RideDuration,
                                style: AppFonts.monrgrey),
                            TextSpan(text:" ) ",style: TextStyle(fontSize: 12)),
                          ])),
                  Spacer(),
                  Icon(Icons.message,size: 15,color: AppColors.blueColor,)
                ],
              ),
            ),
            //SizedBox(height: 15,),
            // Center(
            //   child: GestureDetector(
            //       child: Container(
            //           height: 45,
            //           width: size.width*0.85,
            //           decoration: BoxDecoration(
            //               color: Color(0xFF145c73),
            //               borderRadius: BorderRadius.circular(25)
            //           ),
            //           child: Center(
            //             child: Text("Message",
            //               style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
            //             ),
            //           )
            //       )
            //   ),
            // ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }


}