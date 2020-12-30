import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:norwayfinalcustomer/Registration/UserData.dart';
import 'package:norwayfinalcustomer/car/pages/PastOrdersModel.dart';

class TrackDriver extends StatefulWidget {
  PastOrdersModel pastOrdersModel;
  TrackDriver({Key key, this.pastOrdersModel}) :super(key:key);
  @override
  _TrackDriverState createState() => _TrackDriverState();
}

class _TrackDriverState extends State<TrackDriver> {
  GoogleMapController _controller;
  final Set<Polyline> polyline = {};
  FirebaseAuth _auth = FirebaseAuth.instance;
  DatabaseReference userdataref;
  FirebaseDatabase database1;
  LatLng _toLocation, ToSecLoc;
  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  var current;
  bool checkPlatform = Platform.isIOS;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  final databaseReference = FirebaseDatabase.instance.reference();
  bool cupertinoState = true;
  bool busystatus;
  bool rideaccepted=false;
  String point;
  String distance;
  var DLtn, Dlng;



  @override
  void initState() {
    setState(() {
      getCurrentLocation();
    });


    super.initState();
  }
  void updateMarkerAndCircle(LatLng newLocalData) {
    //  LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
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
      if (_controller != null) {
        _controller.animateCamera(CameraUpdate.newCameraPosition(
            new CameraPosition(
                bearing: 192.8334901395799,
                target: LatLng(newLocalData.latitude, newLocalData.longitude),
                tilt: 0,
                zoom: 16.00)));
      }
    });
  }


  void getCurrentLocation() async {
    try {
      // Uint8List imageData = await getMarker();
      var location = await _locationTracker.getLocation();

      current=new LatLng(location.latitude, location.longitude);
      //updateMarkerAndCircle(current);
      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }
      if (_controller != null) {
                _controller.animateCamera(CameraUpdate.newCameraPosition(
                    new CameraPosition(
                        // bearing: 192.8334901395799,
                        target: LatLng(location.latitude, location.longitude),
                        tilt: 0,
                        zoom: 18.00)));
              }
      trackDriver(widget.pastOrdersModel.acceptedByID);
      // _locationSubscription =
      //     _locationTracker.onLocationChanged().listen((newLocalData) {
      //       if (_controller != null) {
      //         _controller.animateCamera(CameraUpdate.newCameraPosition(
      //             new CameraPosition(
      //                 bearing: 192.8334901395799,
      //                 target: LatLng(newLocalData.latitude, newLocalData.longitude),
      //                 tilt: 0,
      //                 zoom: 18.00)));
      //       }
      //     });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }

  }

  setPolylines(LatLng A, LatLng B) async {
    //flag = false;
    String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${A.latitude},${A.longitude}&destination=${B.latitude},${B.longitude}&key=AIzaSyBR7rrSUi4o118-vGLhDI_f6buJOnZr900";
    http.Response response = await http.get(url);
    Map values = jsonDecode(response.body);
    point = values["routes"][0]["overview_polyline"]["points"];
    distance = values["routes"][0]["legs"][0]["distance"]["text"];
    setState(() {
      polyline.add(Polyline(
          polylineId: PolylineId('route1'),
          visible: true,
          points: convertToLatLng(decodePoly(point)),
          width: 6,
          color: Colors.green[500],
          startCap: Cap.roundCap,
          endCap: Cap.buttCap));

      setState(() {
        addMaker2(A,B);
        // showdialog = true;
      });

      // var s = distance.split(" ");
      // var a = s[0];
      // var dist = s[1];
      // if (double.parse(a) < 100 && dist == "m") {
      //   setState(() {
      //     pickupflag=true;
      //   });
      // }
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

  Future<void> trackDriver(String DrivertId) {
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
          if(widget.pastOrdersModel.isPickedUp){
            var DesLtn = widget.pastOrdersModel.ToLatitude;
            var Deslng = widget.pastOrdersModel.ToLongitude;
            LatLng DestLtLf = new LatLng(DesLtn, Deslng);
            setPolylines(current,DestLtLf);
          }else{
            setPolylines(current, DriverLtLf);
          }
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



  addMaker2(var from_l, to_l) {
    checkPlatform ? print('ios') : print("android");
    final MarkerId markerIdFrom = MarkerId("from_address");
    final MarkerId markerIdTo = MarkerId("to_address");
    // var _dataFrom = dataFrom;
    //var _dataTo = dataTo;

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
            title: "Driver"),
        icon: checkPlatform
            ? BitmapDescriptor.fromAsset("assets/car_icon.png")
            : BitmapDescriptor.fromAsset("assets/car_icon.png")
      // ? BitmapDescriptor.defaultMarker
      // : BitmapDescriptor.defaultMarker
    );

    setState(() {
      markers[markerIdFrom] = marker;
      markers[markerIdTo] = markerTo;
    });
  }


  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 10.4746,
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
            children: <Widget>[
              GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: initialLocation,
                markers: Set<Marker>.of(markers.values),
                onMapCreated: (GoogleMapController controller) {
                  _controller = controller;
                },
                //  markers: Set<Marker>.of(markers.values),
                polylines: polyline,
              ),
            ],
          )),
    );
  }

}
