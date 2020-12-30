import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'dart:io';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoder/model.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:norwayfinalcustomer/API/API.dart';
import 'package:norwayfinalcustomer/Models/vehiclesmodels.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/Component/Color/color.dart';
import 'package:norwayfinalcustomer/place/placeItem.dart';
import 'package:norwayfinalcustomer/place/place_bloc.dart';
import '../../global.dart';

class setlocation extends StatefulWidget {
  Function getuserloc;
  setlocation(this.getuserloc);
  @override
  _setlocationState createState() => _setlocationState();
}

class _setlocationState extends State<setlocation> {
  bool btn = true;
  bool bottom = false;
  bool select = false;
  FocusNode nodeFrom = FocusNode();
  FocusNode nodeTo = FocusNode();
  bool checkAutoFocus = false, inputFrom = false, inputTo = false;
  List<Map<String, dynamic>> dataFrom = new List<Map<String, dynamic>>();
  List<Map<String, dynamic>> dataTo = new List<Map<String, dynamic>>();
  var  _addressTo;
  var placeBloc = PlaceBloc();
  String valueFrom, valueTo;
  var fromm, too, tolatt, tolongg, fromlatt, fromlongg;
  var lat,lng;
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
  DatabaseReference userdataref;
  var DLtn, Dlng;
  String DriverId;
  final databaseReference = FirebaseDatabase.instance.reference();
  String Request_Id;
  DatabaseReference ServicesRef;
  List<VehicleModel> ServiceList;
  bool locstatus = true;
  bool searchbar = true;
  bool popflag = false;
  String DName;
  String ReqServiceImage;
  String RideDistance;
  String RideDuration;
  bool rideaccepted = false;
  String selectedServiceName = '';
  String selectimageservice;
  int selectedServiceBudget = 0;
  double priceAccToSelectedService;
  var Price, ServiceType;
  String paymentflag;
  MarkerId selectedMarker;
  var selectTime = 'select date';
  bool sheduleflage = false;
  var clickstatus=true;

  TextEditingController _textFieldController = TextEditingController();
  String codeDialog;
  String valueText;

  var indicatorvisible = false;
  var i = 0;

  @override
  void initState() {
    ServiceList = new List();
    getCurrentLocation();
    btn = true;
    bottom = false;
    select = false;
    // TODO: implement initState
    super.initState();
  }


  setPolylines() async {
    setState(() {
        addMakers();
    });
  }

  _onAddMarkerButtonPressed(LatLng latlng){
    lat = latlng.latitude;
    lng = latlng.longitude;
    getLocationName(latlng.latitude, latlng.longitude);
    final MarkerId markerIdFrom = MarkerId("My Location");

    final Marker markerTo = Marker(
        markerId: markerIdFrom,
        //position: LatLng(to_l.latitude, to_l.longitude),
        position: latlng,
        icon: checkPlatform
            ? BitmapDescriptor.defaultMarker
            : BitmapDescriptor.defaultMarker);


    CameraUpdate cameraUpdate = CameraUpdate.newLatLngZoom(latlng, 15);
    _controller.animateCamera(cameraUpdate);
    setState(() {
      markers[markerIdFrom] = markerTo;
    });

  }
  addMakers() {
    checkPlatform ? print('ios') : print("android");
    final MarkerId markerIdFrom = MarkerId("My Location");
    // var _dataFrom = dataFrom;
    var _dataTo = dataTo;
    lat = _dataTo[0]['lat'];
    lng = _dataTo[0]['long'];

    final Marker markerTo = Marker(
        markerId: markerIdFrom,
        //position: LatLng(to_l.latitude, to_l.longitude),
        position: LatLng(_dataTo[0]['lat'], _dataTo[0]['long']),
        infoWindow: InfoWindow(
            title: _dataTo[0]['name'], snippet: _dataTo[0]['address']),
        icon: checkPlatform
            // ? BitmapDescriptor.fromAsset("assets/destination.png")
            // : BitmapDescriptor.fromAsset("assets/destination.png"),
            ? BitmapDescriptor.defaultMarker
            : BitmapDescriptor.defaultMarker);

    CameraUpdate cameraUpdate = CameraUpdate.newLatLngZoom(LatLng(_dataTo[0]['lat'], _dataTo[0]['long']), 15);
    _controller.animateCamera(cameraUpdate);
    setState(() {
      markers[markerIdFrom] = markerTo;
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
        //_addressTo = TextEditingController(text: addFrom);
        markers[markerIdFrom] = marker;
      });
    });
  }

  void getCurrentLocation() async {
    try {
      // Uint8List imageData = await getMarker();
      var location = await _locationTracker.getLocation();

      updateMarkerAndCircle(location);
      //getLocationName(location.latitude, location.longitude);
      current = new LatLng(location.latitude, location.longitude);
      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }
      _locationSubscription =
          _locationTracker.onLocationChanged().listen((newLocalData) {
        if (_controller != null) {
          if (locstatus) {
            _controller.animateCamera(CameraUpdate.newCameraPosition(
                new CameraPosition(
                    target:
                        LatLng(newLocalData.latitude, newLocalData.longitude),
                    zoom: 18.00)));
            updateMarkerAndCircle(location);
            setState(() {
              locstatus = false;
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
    //_addressTo = first.addressLine;
    setState(() {
      _addressTo = TextEditingController(text: addFrom);
      print(addFrom);
    });
  }

  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 10.4746,
  );

  String txt = '';
  final format = DateFormat("yyyy-MM-dd HH:mm");
  TimeOfDay selectedTime = TimeOfDay.now();
  String selectDate = 'select time';
  var comparetime;

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
          );
        },
      ),
    );
  }

  void getSelectedpayment(String paymentflag) {
    setState(() {
      this.paymentflag = paymentflag;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Select Location",
            style: TextStyle(color: AppColors.black),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: Visibility(
          visible: btn,
          child: InkWell(
            child: Container(
                color: Colors.green[500],
                width: MediaQuery.of(context).size.width / 9.75,
                height: MediaQuery.of(context).size.width / 6.75,
                alignment: Alignment.center,
                child: Text(
                  'Confirm',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
            onTap: () {
              setState(() {
                if (_addressTo == null) {
                  Fluttertoast.showToast(
                      msg: "Please Enter Address",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 3,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
                else{

                  if(usertoken!=null)
                    {
                      _displayTextInputDialog(context);

                    }
                  else
                    {
                      Fluttertoast.showToast(
                          msg: "Sign in required",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 3,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }

                }

              });
            },
          ),
        ),
        body: Container(
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.only(top: 45),
              child: GoogleMap(
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                mapType: MapType.normal,
                initialCameraPosition: initialLocation,
                markers: Set<Marker>.of(markers.values),
                onMapCreated: (controller) {
                  setState(() {
                    _controller = controller;
                  });
                },
                onTap: (latlang){
                  _onAddMarkerButtonPressed(latlang);
                },
              ),
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
                            color: Colors.white,
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                new Expanded(
                                  flex: 1,
                                  child: new Column(
                                    children: <Widget>[
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
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
                                              style: TextStyle(fontSize: 15),
                                              decoration:
                                                  InputDecoration.collapsed(
                                                fillColor: Colors.white,
                                                hintStyle: TextStyle(
                                                    color: Colors.black),
                                                hintText:
                                                    'Enter Address to save',
                                              ),
                                              focusNode: nodeTo,
                                              controller: _addressTo,
                                              onChanged: (String value) {
                                                placeBloc.searchPlace(value);
                                              },
                                              onTap: () {
                                                setState(() {
                                                  inputTo = true;
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
                        Container(
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
                                        List<PlaceItemRes> places =
                                            snapshot.data;
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
                                                  "lat": places
                                                      .elementAt(index)
                                                      .lat,
                                                  "long": places
                                                      .elementAt(index)
                                                      .lng
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
                  height: MediaQuery.of(context).size.height / 1.8,
                  child: _getUpperLayer()),
            ),
            indicatorshow(indicatorvisible),
          ]),
        ),
      ),
    );
  }

  void DrawRoute() {
    setPolylines();
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Enter the Title Name'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Text Field in Dialog"),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('OK'),
                onPressed: () async{
               if(clickstatus)
                 {
                   clickstatus=false;
                   codeDialog = valueText;
                   checkconnection();
                   await Future.delayed(Duration(seconds: 2), (){
                     if(result != null && result){

                       Navigator.pop(context);
                       API.adduserloc(adduserlocAPI+userid,codeDialog,_addressTo.text.toString(),lat,lng,userid);
                       waittoaddaddress();
                     }
                     else{
                       clickstatus=true;
                       internettoast();
                     }
                   });

                 }

                },
              ),

            ],
          );
        });
  }


  waittoaddaddress()async{
    if (i == 0) {
      setState(() {
        indicatorvisible = true;
        //indicator();
      });
    }
    await Future.delayed(const Duration(seconds: 1), () {
      if (API.success == 'true') {
        setState(() {
          indicatorvisible = false;
        });
        i = 0;
        clickstatus=true;
        widget.getuserloc();
        Navigator.pop(context);
      } else {
        waittoaddaddress();
      }
    });

  }
}
