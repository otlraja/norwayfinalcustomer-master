import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoder/model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong/latlong.dart';
import 'package:norwayfinalcustomer/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Component/Color/color.dart';
import 'firstpage.dart';
import 'global.dart';
class SplashTest extends StatefulWidget {
  static SharedPreferences sharedPreferences;

  @override
  _SplashTestState createState() => _SplashTestState();
}

class _SplashTestState extends State<SplashTest> with TickerProviderStateMixin{

  LatLng _center;
  Position currentLocation;

  Widget delay(){
    Future.delayed(
           const Duration(seconds: 5), ()
    {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => Firstpage()));
    });
  }
  initi(){
    SharedPreferences.getInstance().then((prefs) {
      SplashTest.sharedPreferences = prefs;
    });
  }

  getUserLocation() async {
    currentLocation = await locateUser();
    setState(() {
      //_center = LatLng(currentLocation.latitude, currentLocation.longitude);
      getLocationName(currentLocation.latitude, currentLocation.longitude);
    });
    print('center $_center');
  }
  Future<Position> locateUser() async {
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  void getLocationName(double lat, double lng) async {
    final coordinates = new Coordinates(lat, lng);
    var addresses =
    await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print("${first.featureName} : ${first.addressLine}");
    usercurraddr = first.addressLine;
    usercurrlat = lat;
    usercurrlng = lng;
    //_addressTo = first.addressLine;
  }

  @override
  void initState() {
    // TODO: implement initState
    initi();
    getUserLocation();
    checkconnection();
    delay();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        /// Set Background image in splash screen layout (Click to open code)

        child: Container(
          decoration: BoxDecoration(
              gradient: new LinearGradient(
                  colors: [

                    AppColors.black,
                    Colors.black,
                  ],
                  stops: [0.0, 1.0],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  tileMode: TileMode.repeated
              )
          ),

          child: Center(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/logo-AK-Booker (1).png',width: 200,height: 200,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}