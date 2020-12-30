import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:norwayfinalcustomer/Component/Style/style.dart';
import 'package:norwayfinalcustomer/foodModule/MOdel/FoodmsgCards/foodmsg.dart';
import 'package:norwayfinalcustomer/global.dart';

import '../Foodmsg_view.dart';
class Ridersdetail extends StatefulWidget {
  final index;
  Ridersdetail(this.index);
  @override
  _RidersdetailState createState() => _RidersdetailState();
}

class _RidersdetailState extends State<Ridersdetail> {
  GoogleMapController _controller;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  bool checkPlatform = Platform.isIOS;


  Widget _getUpperLayer() {
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      minChildSize: 0.1,
      maxChildSize: 0.8,
      builder: (BuildContext context, ScrollController scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Container(
            height: MediaQuery.of(context).size.height/2.2,
            color: Colors.white,
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Center(child: Icon(Icons.remove,size: 50,)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            alignment: Alignment.centerLeft,
                            child: Image(
                              image: AssetImage('assets/tshirt.jpg'),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              Text(
                                "Omar norway",
                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:18.0),
                                child: Text(
                                  "Delivery Partner",
                                  style: TextStyle(fontSize: 15,),
                                ),
                              ),
                            ],
                          ),

                          Spacer(),
                          InkWell(

                            child: Icon(
                              Icons.message,
                              color: Colors.green[500],
                            ),
                            onTap: (){
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) => Foodmsgview()));
                            },
                          ),
                          SizedBox(width: 15,),
                          Icon(
                              Icons.phone,
                              color: Colors.green[500]
                          ),
                          SizedBox(width: 10,),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          Container(
                            width: MediaQuery.of(context).size.width/1.5,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  icon: Icon(Icons.edit),
                                  border: InputBorder.none,
                                  hintText: globalorderinprogressfood == null ?
                                  'Any Instruction? E.g No Tomatos':
                                  globalorderinprogressfood[widget.index].instr.toString() == ""?
                                      'No Instruction':
                                  globalorderinprogressfood[widget.index].instr.toString()

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Container(
                          width: MediaQuery.of(context).size.width/1.2,
                          height: MediaQuery.of(context).size.height,
                          child: Stack(
                            children: [
                              Text(
                                'Payment Info',
                                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[500],),
                              ),
                              Positioned(
                                top: 25,
                                child: Text(
                                  'Subtotal',
                                  style: TextStyle(color: Colors.black,fontSize: 13),
                                ),
                              ),

                              Positioned(
                                top: 25,
                                left: 260,
                                child: Text(
                                  globalorderinprogressfood == null ?
                                  '0.0':
                                  (globalorderinprogressfood[widget.index].price - globalorderinprogressfood[widget.index].tax).toString(),
                                  style: TextStyle(color: Colors.black,fontSize: 13),
                                ),
                              ),
                              Positioned(
                                top: 45,
                                child: Text(
                                  'Services Fees',
                                  style: TextStyle(color: Colors.black,fontSize: 13),
                                ),
                              ),

                              Positioned(
                                top: 45,
                                left: 260,
                                child: Text(
                                  globalorderinprogressfood == null ?
                                  '0.0':
                                  (globalorderinprogressfood[widget.index].tax).toString(),
                                  style: TextStyle(color: Colors.black,fontSize: 13),
                                ),
                              ),
                              Positioned(
                                top: 65,
                                child: Text(
                                  globalorderinprogressfood == null ?
                                  'Cash On Delivery':
                                  globalorderinprogressfood[widget.index].payment,
                                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 13),
                                ),
                              ),

                              Positioned(
                                top: 65,
                                left: 260,
                                child: Text(
                                  globalorderinprogressfood == null ?
                                  '0.0':
                                  globalorderinprogressfood[widget.index].price.toString(),
                                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );

      },
    );
  }
  addMakers() {
    checkPlatform ? print('ios') : print("android");
    final MarkerId markerIdFrom = MarkerId("My Location");
    final MarkerId markerIdVendor = MarkerId("Vendor Location");



    final Marker markerTo = Marker(
        markerId: markerIdFrom,
        //position: LatLng(to_l.latitude, to_l.longitude),
        position: LatLng(double.parse(globalorderinprogressfood[widget.index].userlat.toString()),
            double.parse(globalorderinprogressfood[widget.index].userlng.toString())),
        infoWindow: InfoWindow(
            title: "user"),
        icon: checkPlatform
        // ? BitmapDescriptor.fromAsset("assets/destination.png")
        // : BitmapDescriptor.fromAsset("assets/destination.png"),
            ? BitmapDescriptor.defaultMarker
            : BitmapDescriptor.defaultMarker);

    final Marker markervendor = Marker(
        markerId: markerIdVendor,
        //position: LatLng(to_l.latitude, to_l.longitude),
        position: LatLng(double.parse(globalorderinprogressfood[widget.index].venlat.toString()),
            double.parse(globalorderinprogressfood[widget.index].venlng.toString())),
        infoWindow: InfoWindow(
            title: "vendor"),
        icon: checkPlatform
        // ? BitmapDescriptor.fromAsset("assets/destination.png")
        // : BitmapDescriptor.fromAsset("assets/destination.png"),
            ? BitmapDescriptor.defaultMarker
            : BitmapDescriptor.defaultMarker);

    // CameraUpdate cameraUpdate = CameraUpdate.newLatLngZoom(LatLng(double.parse(usercurrlat.toString()), double.parse(usercurrlng.toString())), 10);
    // _controller.animateCamera(cameraUpdate);
    setState(() {
      markers[markerIdFrom] = markerTo;
      markers[markerIdVendor] = markervendor;
    });
  }

  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(double.parse(usercurrlat.toString()), double.parse(usercurrlng.toString())),
    zoom: 10.4746,
  );
  @override
  Widget build(BuildContext context) {
    addMakers();
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    height:300,
                    child: Stack(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: MediaQuery.of(context).size.height/2,
                            color: Colors.black,
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

                            ),

                          ),
                        ),
                      ),
                      _getUpperLayer(),

                    ],)),
              ),
              Positioned(
                top:10.0,left: 20,
                child: InkWell(child: Icon(Icons.arrow_back,color: Colors.black,),
                onTap: (){
                  Navigator.pop(context);
                },),
              ),
              Padding(
                padding: const EdgeInsets.only(top:15),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Text("Rider Details",
                      style: AppFonts.monmbold1,
                    ),

                ),
              ),

              Positioned(
                  top: 80,
                  left: 20,
                  child: Container(
                      width: 60,
                      height: 60,
                      child: globalorderinprogressfood == null ?
                      Image.asset('assets/1.png',fit: BoxFit.fill,):
                    Image.network(globalorderinprogressfood[widget.index].venimg,fit: BoxFit.fill,),
                  )
              ),
              Positioned(
                  top: 90,
                  left: 85,
                  child: Container(
                    width: MediaQuery.of(context).size.width/1.5,
                    child: Row(
                      children: [
                        Text(
                          globalorderinprogressfood == null ?
                           'Vegatable':
                          globalorderinprogressfood[widget.index].venname,
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          globalorderinprogressfood == null ?
                          'Picked Arranged':
                          globalorderinprogressfood[widget.index].status,
                          style: TextStyle(fontSize: 15,color: Colors.green[500]),
                        ),
                      ],
                    ),
                  )
              ),
              Positioned(
                  top: 115,
                  left: 85,
                  child: Row(
                    children: [
                      Text(
                        globalorderinprogressfood == null ?
                        '20 June , 11:58am':
                        globalorderinprogressfood[widget.index].date,
                        style: TextStyle(fontSize: 12,color: Colors.grey[500]),
                      ),
                      SizedBox(width: 100,),
                      Text(
                        globalorderinprogressfood == null ?
                        '\$11.00 | PayPal':
                        "\$ "+globalorderinprogressfood[widget.index].price.toString(),
                        style: TextStyle(fontSize: 12,color: Colors.grey[500]),
                      ),


                    ],
                  )
              ),
              Positioned(
                top: 130,
                left: 90,
                child: Divider(
                  color: Colors.green[500],
                  thickness: 1.0,
                ),
              ),
              Positioned(
                  top: 160,
                  left: 20,
                  child: Row(
                    children: [
                      Icon(
                     Icons.location_on,
                        color: Colors.green[500],
                        size: 15,
                      ),
                      SizedBox(width: 10,),
                      Container(
                        width: MediaQuery.of(context).size.width/1.5,
                        child: Text(
                          globalorderinprogressfood == null ?
                          'LiverPool Street 12':
                          globalorderinprogressfood[widget.index].venadd,
                          style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                      ),

                    ],
                  )
              ),
              Positioned(
                  top: 190,
                  left: 20,
                  child: Row(
                    children: [
                      Icon(
                        Icons.gps_not_fixed,
                        color: Colors.green[500],
                        size: 15,
                      ),
                      SizedBox(width: 10,),
                      Container(
                        width: MediaQuery.of(context).size.width/1.5,
                        child: Text(
                          globalorderinprogressfood == null ?
                          'Home':
                          globalorderinprogressfood[widget.index].useraddr,
                          style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold),
                          maxLines: 2,
                        ),
                      ),

                    ],
                  )
              ),



            ],
          ),
        ),
      ),
    );
  }
}
