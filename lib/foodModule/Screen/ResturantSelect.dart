import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:norwayfinalcustomer/API/API.dart';
import 'package:norwayfinalcustomer/API/Distance.dart';
import 'package:norwayfinalcustomer/Models/foodvendorsmodel.dart';
import 'package:norwayfinalcustomer/RegistrationApi/Login.dart';
import 'package:norwayfinalcustomer/foodModule/Screen/foodHome.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/SearchBarfood.dart';
import 'package:geolocator/geolocator.dart';
import '../../global.dart';
import 'Setlocation.dart';
import 'foodcheckout.dart';

class ResturantSelect extends StatefulWidget {
  @override
  _ResturantSelectState createState() => _ResturantSelectState();
}

class _ResturantSelectState extends State<ResturantSelect> {
  var _value = '0';
  var indicatorvisible = false;
  String dropdownValue = 'First';
  var i = 0;
  LatLng _center;
  Position currentLocation;
  List<String> ddl = new List();
  var clickstatus=true;
  List<FoodVendors> _vendorList = [];
  List<FoodVendors> _filteredList = [];
  TextEditingController controller = new TextEditingController();
  String filter = "";


  Widget _SearchBar(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      child: TextField(
        onChanged: (val){
          filter=val;
        },
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.blueGrey[300],
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          hintText: "Search Item And Stores",
          prefixIcon: Icon(
            Icons.search,
            color: Colors.blueGrey[300],
          ),
          hintStyle: TextStyle(
            fontSize: 15.0,
            color: Colors.blueGrey[300],
          ),
        ),
        maxLines: 1,
        controller: controller,
      ),
    );
  }
  waittofetchvendorsproducts(var index) async {
    if (i == 0) {
      setState(() {
        indicatorvisible = true;
      });
    }
    i++;
    await Future.delayed(const Duration(seconds: 1), () {
      if (API.success == 'true') {
        setState(() {
          indicatorvisible = false;
        });
        i = 0;
        clickstatus=true;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Food_Home(index)));
      } else {
        waittofetchvendorsproducts(index);
      }
    });
  }

  @override
  void initState() {
    // List<FoodVendors> tmpList = new List<FoodVendors>();
    // for(int i=0; i < globalvendors.length; i++) {
    //   tmpList.add(globalvendors[i]);
    // }
    setState(() {
      _vendorList = globalvendors;
      _filteredList = _vendorList;
    });
    controller.addListener(() {
      if(controller.text.isEmpty) {
        setState(() {
          filter = "";
          _filteredList = _vendorList;
        });
      } else {
        setState(() {
          filter = controller.text;
        });
      }
    });
    ddl.add('Set Location');
    ddl.add('Current Location');
    getuserlocations();
    super.initState();
  }

  getuserlocations(){
      setState(() {
        appbar();
      });
  }



  showAlertDialog() {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Delivery", style: TextStyle(color: Colors.green)),
      onPressed: () {
        deliverytype = "AK Bookers Rider";
        Navigator.pop(context);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => FoodCheckout(set)));
      },
    );
    Widget cancel = FlatButton(
      child: Text("Cancel", style: TextStyle(color: Colors.red)),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Take a Way", style: TextStyle(color: Colors.pinkAccent)),
      onPressed: () {
        deliverytype = "Take A way";
        Navigator.pop(context);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => FoodCheckout(set)));
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("How Do You Like To Take Order",
          style: TextStyle(color: Colors.green[300])),
      actions: [
        cancelButton,
        cancel,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  set(){

  }
  showAlertDialoglogin() {
    // set up the buttons
    Widget cancel = FlatButton(
      child: Container(
          height: 40,
          width: 80,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: Text("Close", style: TextStyle(color: Colors.green)))),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(

      child: Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 40,
          width: 80,

          child: Center(child: Text("SignIn", style: TextStyle(color: Colors.white)))),
      onPressed: () {
        Navigator.pop(context);
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => Loginapi()));
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),

      title: Text("First SignIn to View Cart! ", style: TextStyle(color: Colors.green[300], fontSize: 14)),
      actions: [
        cancel,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  Future<Position> locateUser() async {
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  getUserLocation() async {
    currentLocation = await locateUser();
    setState(() {
      _center = LatLng(currentLocation.latitude, currentLocation.longitude);
    });
    print('center $_center');
  }

   _dropDownItem() {
    ddl = new List();
    ddl.add('Set Location');
    ddl.add('Current Location');
    for(int i = 0; i < globaluserlocation.length; i++){
      if(!ddl.contains(globaluserlocation[i].title.toString()))
      ddl.add(globaluserlocation[i].title);
    }

    return ddl.asMap().map((i, element) => MapEntry(i,
        DropdownMenuItem(
          value: i.toString(),
          child: Text(element),
        )
    )).values.toList();
  }

Widget appbar(){
    return AppBar(
      title: new DropdownButton<String>(
        value: _value,
        items: _dropDownItem(),
        onChanged: (String value) {
          setState(() => _value = value);
          if(_value == '1'){
            getUserLocation();
          }
          else if (_value == "0") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => setlocation(getuserlocations)));
          }
          else{
            var index = int.parse(_value) - 2;
            userselectlat = globaluserlocation[index].latitude.toString();
            userselectlng = globaluserlocation[index].longitude.toString();
            userselectadd = globaluserlocation[index].address.toString();
          }
        },
      ),
      leading: GestureDetector(
        child: Icon(
          Icons.location_on,
          color: Colors.green,
        ),
        onTap: () {
          // getUserLocation();
        },
      ),
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                if (usertoken != null) {
                  showAlertDialog();
                } else {
                  showAlertDialoglogin();
                }
              },
              child: Icon(
                Icons.shopping_cart,
                color: Colors.green[500],
                size: 26.0,
              ),
            )),
      ],
    );
}
  @override
  Widget build(BuildContext context) {

    if((filter.isNotEmpty)) {
      List<FoodVendors> tmpList = new List<FoodVendors>();
      for(int i = 0; i < _filteredList.length; i++) {
        if(_filteredList[i].name.toLowerCase().contains(filter.toLowerCase())) {
          tmpList.add(_filteredList[i]);
        }
      }
      _filteredList = tmpList;
    }

    return Scaffold(
      appBar: appbar(),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, right: 20, left: 20),
              child: _SearchBar(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80.0, right: 30, left: 30),
              child: Text(
                "Got Everything Deliver",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 120.0, left: 20, right: 20),
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(_vendorList == null ? 0 : _filteredList.length, (index) {
                  return Container(

                    child: Card(
                      child: InkWell(
                        child: Column(

                          children: [
                            SizedBox(height: 10,),
                            _filteredList[index].image == null ?
                            Image.asset(
                              "assets/icon/food.png",
                              height: 80,
                            ):
                            Image.network(_filteredList[index].image, height: 80,width: 100,fit:BoxFit.fill ,),
                            SizedBox(
                              height: 5,
                            ),
                            Text("${_filteredList[index].name}",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                            Padding(
                              padding: const EdgeInsets.only(left: 8 , right: 8),
                              child: Text(_filteredList[index].address??"Ho.no 378  Newton Street Californ north Amarica", style: TextStyle(fontSize: 8,  ),),
                            )
                          ],
                        ),
                        onTap: () {

                          if(clickstatus)
                            {
                              clickstatus=false;
                              vendordistance =Distancee().distance1(double.parse(usercurrlat.toString()),double.parse(usercurrlng.toString()),
                                  double.parse(globalvendors[index].lat.toString()),double.parse(globalvendors[index].lng.toString()));
                              vendorname = globalvendors[index].name.toString();
                              vendoraddress = globalvendors[index].address.toString();
                              vendorid = globalvendors[index].id.toString();

                              if (type == "food") {
                                API.vendorProducts(FoodproductApi +
                                    globalvendors[index].id.toString());
                              } else if (type == "grocery") {
                                API.vendorProducts(GroceryProductApi +
                                    globalvendors[index].id.toString());
                              } else if (type == "store") {
                                API.vendorProducts(StoreProductApi +
                                    globalvendors[index].id.toString());
                              }
                              waittofetchvendorsproducts(index);
                            }


                        },
                      ),
                      elevation: 1,
                      color: Colors.grey[200],
                    ),
                  );
                }),
              ),
            ),
            indicatorshow(indicatorvisible)
          ],
        ),
      ),
    );
  }

}