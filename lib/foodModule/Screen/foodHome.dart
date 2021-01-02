import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/API/API.dart';
import 'package:norwayfinalcustomer/Models/productType.dart';
import 'package:norwayfinalcustomer/Registration/login.dart';
import 'package:norwayfinalcustomer/Models/products.dart';
import 'package:norwayfinalcustomer/RegistrationApi/Login.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/Component/Style/style.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/SearchBarfood.dart';
import 'package:norwayfinalcustomer/global.dart';
import '../../global.dart';
import '../../main.dart';
import '../../testSplash.dart';
import 'FoodReview.dart';
import 'foodcheckout.dart';

bool val = false;
var setcartlength = globalfoodcart;
var setcartprice = "0.0";
var clickstatus=true;

class Food_Home extends StatefulWidget {
  final index;


  Food_Home(this.index);
  static Widget carttext() {
    if(type == 'food'){
      setcartlength = globalfoodcart;
      setcartprice = cartprice == null ? "0.0" : cartprice.toString();
    }
    else if(type == "grocery"){
      setcartlength = globalgrocerycart;
      setcartprice = grocerycartprice == null ? "0.0" : grocerycartprice.toString();
    }
    else if(type == 'store' ){
      setcartlength = globalstorecart;
      setcartprice = storecartprice== null ? "0.0" : storecartprice.toString();
    }
    if (setcartlength.length != 0 ) {

      val = true;
      return Text(
        'Item : ' +
            setcartlength.length.toString()
            +
            ' | \$ ' +  setcartprice.toString(),
        style: TextStyle(
            fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
      );
    }
    else {
      val = false;
      return Text(
        'Item : 0 | \$ 0.0',
        style: TextStyle(
            fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
      );
    }
  }
  @override
  _Food_HomeState createState() => _Food_HomeState();
}

class _Food_HomeState extends State<Food_Home> with TickerProviderStateMixin {
  String filter = "";
  TextEditingController controller = new TextEditingController();
  List<Products> _filteredList = [];
  List<Products> _vendorList = [];
  var indicatorvisible = false;
  var index=0;
  var i = 0;

  TabController _tabController;
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
    setState(() {
      calculatequantity();
       Food_Home.carttext();
    });
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

  showAlertDialogcart() {

    // set up the buttons
    Widget no = FlatButton(
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
    Widget yes = FlatButton(

      child: Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 40,
          width: 80,

          child: Center(child: Text("Continue", style: TextStyle(color: Colors.white)))),
      onPressed: () {

        if(type == "food"){
          globalfoodcart.clear();
          cartprice = 0.0;

          SplashTest.sharedPreferences.setString("cartprice",
              cartprice.toString());
          final String
          encodedData =
          Products.encodeMusics(globalfoodcart);
          SplashTest.sharedPreferences.setString("foodcart",
              encodedData);
          setState(() {
            Food_Home.carttext();
          });

          Navigator.pop(context);
        }
        else if(type == 'grocery'){
          globalgrocerycart.clear();
          grocerycartprice = 0.0;

          SplashTest.sharedPreferences.setString("grocerycartprice",
              grocerycartprice.toString());
          final String
          encodedData =
          Products.encodeMusics(globalgrocerycart);
          SplashTest.sharedPreferences.setString("grocerycart",
              encodedData);
          setState(() {
            Food_Home.carttext();
          });

          Navigator.pop(context);
        }
        else if(type == 'store'){
          globalstorecart.clear();
          storecartprice = 0.0;

          SplashTest.sharedPreferences.setString("storecartprice",
              storecartprice.toString());
          final String
          encodedData =
          Products.encodeMusics(globalstorecart);
          SplashTest.sharedPreferences.setString("storecart",
              encodedData);
          setState(() {
            Food_Home.carttext();
          });

          Navigator.pop(context);
        }



        // Navigator.of(context).push(MaterialPageRoute(builder: (_) => Login()));
      },
    );
    // set up the AlertDialog

    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),

      title: Text("You have already selected products form a different vendor. If you continues, Your cart and selection will be removed",

        style: TextStyle(color: Colors.green, fontSize: 14),
      ),
      actions: [
        no,
        yes,
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

  waittofetchvendorsproducts() async {

    await Future.delayed(const Duration(seconds: 1), () {
      if (API.success == 'true') {
        print('hogaya');
        //_tabController = TabController(length: globalproductType.length, vsync: this);

        setState(() {

        });
      } else {
        waittofetchvendorsproducts();
      }
    });
  }


  getfilteredlist(){
    List<Products> tmpList = new List<Products>();
    for(int i=0; i < globalproductType[index].product.length; i++) {
      tmpList.add(globalproductType[index].product[i]);
    }
    setState(() {
      _vendorList = tmpList;
      _filteredList = _vendorList;
    });
  }


  getlist(){
    if (type == "food") {
      API.vendorProducts(FoodproductApi +
          globalvendors[widget.index].id.toString());
    } else if (type == "grocery") {
      API.vendorProducts(GroceryProductApi +
          globalvendors[widget.index].id.toString());
    } else if (type == "store") {
      API.vendorProducts(StoreProductApi +
          globalvendors[widget.index].id.toString());
    }
    waittofetchvendorsproducts();
  }

  @override
  void initState() {
    _tabController = new TabController(length: globalproductType.length, vsync: this);
    _tabController.addListener(() {
      index = _tabController.index;
      getfilteredlist();
    });
    List<Products> tmpList = new List<Products>();

      for(int j=0; j < globalproductType[0].product.length; j++) {
        tmpList.add(globalproductType[0].product[j]);
      }
    setState(() {
      _vendorList = tmpList;
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
    calculatequantity();
    super.initState();
  }

  void calculatequantity() {

    if(type == 'food'){
      if(globalfoodcart.isNotEmpty) {
        for (int i = 0; i < globalproductType.length; i++) {
          for (int j = 0; j < globalproductType[i].product.length; j++) {
            var a = globalproductType[i].product[j].id;

            var b = globalfoodcart.where((element) => element.id == a);

            if (b.length != 0) {
              globalproductType[i].product[j] = b.first;
            }
          }
        }
      }
      else{
        for (int i = 0; i < globalproductType.length; i++) {
          for (int j = 0; j < globalproductType[i].product.length; j++) {
              globalproductType[i].product[j].orderquantity = 0;
          }
        }
      }
    }
    else if(type == 'grocery'){
      if(globalgrocerycart.isNotEmpty) {
        for (int i = 0; i < globalproductType.length; i++) {
          for (int j = 0; j < globalproductType[i].product.length; j++) {
            var a = globalproductType[i].product[j].id;

            var b = globalgrocerycart.where((element) => element.id == a);

            if (b.length != 0) {
              globalproductType[i].product[j] = b.first;
            }
          }
        }
      }
      else{
        for (int i = 0; i < globalproductType.length; i++) {
          for (int j = 0; j < globalproductType[i].product.length; j++) {
            globalproductType[i].product[j].orderquantity = 0;
          }
        }
      }
    }
    else if(type == 'store'){
      if(globalstorecart.isNotEmpty) {
        for (int i = 0; i < globalproductType.length; i++) {
          for (int j = 0; j < globalproductType[i].product.length; j++) {
            var a = globalproductType[i].product[j].id;

            var b = globalstorecart.where((element) => element.id == a);

            if (b.length != 0) {
              globalproductType[i].product[j] = b.first;
            }
          }
        }
      }
      else{
        for (int i = 0; i < globalproductType.length; i++) {
          for (int j = 0; j < globalproductType[i].product.length; j++) {
            globalproductType[i].product[j].orderquantity = 0;
          }
        }
      }
    }
  }

  void calculateprice() {

    if(type == 'food'){
      cartprice = 0.0;
      for (int i = 0; i < globalfoodcart.length; i++) {
        cartprice += globalfoodcart[i].price;
        print(cartprice.toString());
      }
      //Food_Home.carttext();
    }
    else if(type == 'grocery'){
      grocerycartprice = 0.0;
      for (int i = 0; i < globalgrocerycart.length; i++) {
        grocerycartprice += globalgrocerycart[i].price;
        print(grocerycartprice.toString());
      }
      //Food_Home.carttext();
    }
    else if(type == 'store'){
      storecartprice = 0.0;
      for (int i = 0; i < globalstorecart.length; i++) {
        storecartprice += globalstorecart[i].price;
        print(storecartprice.toString());
      }
      //Food_Home.carttext();
    }
  }

  waittofetchvendorsreviews(var index)async{
    if(i == 0){
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
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => FoodReview(widget.index)));
      }
      else {
        waittofetchvendorsreviews(index);
      }
    });
  }

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

  Widget build(BuildContext context) {
    // getlist();

    if((filter.isNotEmpty)) {
      List<Products> tmpList = new List<Products>();
      for(int i = 0; i < _filteredList.length; i++) {
        if(_filteredList[i].name.toLowerCase().contains(filter.toLowerCase()) ||
            _filteredList[i].price.toString().contains(filter.toLowerCase())) {
          tmpList.add(_filteredList[i]);
        }
      }
      _filteredList = tmpList;
    }

    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: globalproductType.length,
          child: Column(
            children: [
              Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Icon(Icons.arrow_back),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        vendorname,
                        style: AppFonts.monmbold1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
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
                        ),
                      )
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.location_on,
                    color: Colors.grey[500],
                    size: 10,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    vendordistance.toStringAsFixed(1).toString()+' | ' + vendoraddress,
                    style: TextStyle(color: Colors.grey[500], fontSize: 10),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.timer,
                    color: Colors.grey[500],
                    size: 10,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    vendortime.toStringAsFixed(1).toString()+' MINS',
                    style: TextStyle(color: Colors.grey[500], fontSize: 10),
                  ),
                  Spacer(),

                  InkWell(
                    onTap: () {
                      if(clickstatus)
                      {

                        if(globalvendors[widget.index].totalReviews != 0) {
                          clickstatus=false;
                          if (type == "food") {
                            API.vendorreviews(
                                vendorreviewsAPI + globalvendors[widget.index].id
                                    .toString());
                            waittofetchvendorsreviews(widget.index);
                          }
                          else if(type=="grocery"){
                            API.vendorreviews(groceryvendorreviewsAPI+globalvendors[widget.index].id.toString());
                            waittofetchvendorsreviews(widget.index);
                          }
                          else if(type=="store"){
                            API.vendorreviews(storevendorreviewsAPI+globalvendors[widget.index].id.toString());
                            waittofetchvendorsreviews(widget.index);
                          }

                        }
                      }

                    },
                    child: Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.green[500],
                            size: 12,
                          ),
                          Text(
                            double.parse(globalvendors[widget.index].avgRating.toString()).toStringAsFixed(1).toString()+' ',
                            style: TextStyle(color: Colors.green[500], fontSize: 12),
                          ),
                          Text(
                            globalvendors[widget.index].totalReviews.toString()+' Reviews',
                            style: TextStyle(color: Colors.grey[500], fontSize: 12),
                          ),

                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey[500],
                            size: 12,
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    ),
                  ),

                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: _SearchBar(),
              ),
              Container(
                color: Colors.white,
                constraints: BoxConstraints.expand(height: 60),
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  tabs: List.generate(
                    globalproductType.length,
                        (i) => Tab(
                      child: Container(
                        alignment: Alignment.center,
                        constraints: BoxConstraints.expand(width: 80),
                        child: Text(
                          globalproductType[i].name,
                          style: AppFonts.monmbold,
                        ),
                      ),
                    ),
                  ),
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 70),
                  labelPadding: EdgeInsets.symmetric(horizontal: 40.0),
                  unselectedLabelColor: Colors.grey[400],
                  labelColor: Colors.green[500],
                  indicatorColor: Colors.green[500],
                ),
              ),
              Expanded(
                child: Container(
                  child: TabBarView(
                    //controller: _tabController,
                    physics: NeverScrollableScrollPhysics(),
                    children: List.generate(
                      globalproductType.length,
                          (i) => SingleChildScrollView(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 1.8,
                          child: globalproductType[i].product.isEmpty
                              ? Container(
                            padding: EdgeInsets.only(bottom: 100),
                            child: Center(
                                child: Text(
                                  "No Items Available",
                                  style: AppFonts.monmboldgrey,
                                )),
                          )
                              : Container(
                            width: MediaQuery.of(context).size.width,
                            child: RefreshIndicator(
                              child: ListView.builder(
                                  padding: EdgeInsets.only(bottom: 60),
                                  scrollDirection: Axis.vertical,
                                  itemCount: _filteredList.length,
                                  itemBuilder: (_, index) {
                                    return InkWell(
                                      // onTap: ontap,
                                      child: Container(
                                          color: Colors.white,
                                          padding: EdgeInsets.only(left: 10,right: 10,top: 10),
                                          child: Column(
                                            // mainAxisSize:
                                            //     MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.only(
                                                        left: 0.0,
                                                        top: 5),
                                                    child: Container(
                                                      height: 85,
                                                      width: 85,
                                                      decoration:
                                                      BoxDecoration(
                                                          image:
                                                          DecorationImage(
                                                            fit:
                                                            BoxFit.fill,
                                                            image:
                                                            NetworkImage(
                                                              _filteredList[index]
                                                                  .image,
                                                            ),
                                                          )),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .only(
                                                        top: 5,
                                                        left: 10),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .start,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Text(
                                                            _filteredList[index]
                                                                .name,
                                                            style: AppFonts
                                                                .monmblack),
                                                        Padding(
                                                          padding:
                                                          EdgeInsets
                                                              .only(
                                                            top: 4.0,
                                                          ),
                                                          child: Text(
                                                            "\$ " +
                                                                _filteredList[index]
                                                                    .price
                                                                    .toString(),
                                                            textAlign:
                                                            TextAlign
                                                                .left,
                                                            style: AppFonts
                                                                .monrblack,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .only(
                                                        top: 50),
                                                    child: Container(
                                                      height: 40,
                                                      decoration:
                                                      BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors
                                                                .green[
                                                            500]),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            20),
                                                      ),
                                                      child: Row(
                                                        children: <
                                                            Widget>[
                                                          _filteredList[index]
                                                              .orderquantity !=
                                                              0
                                                              ? new IconButton(
                                                            icon:
                                                            new Icon(Icons.remove),
                                                            onPressed: () =>
                                                                setState(() {
                                                                  _filteredList[index].orderquantity--;
                                                                  var a;
                                                                  if(type == 'food'){
                                                                    a = globalfoodcart.where((element) =>
                                                                    element.id ==
                                                                        _filteredList[index].id);

                                                                    globalfoodcart.remove(a.first);
                                                                  }
                                                                  else if(type == 'grocery'){
                                                                    a = globalgrocerycart.where((element) =>
                                                                    element.id ==
                                                                        _filteredList[index].id);

                                                                    globalgrocerycart.remove(a.first);
                                                                  }
                                                                  else if(type == 'store'){
                                                                    a = globalstorecart.where((element) =>
                                                                    element.id ==
                                                                        _filteredList[index].id);

                                                                    globalstorecart.remove(a.first);
                                                                  }

                                                                  globalproductType[i].product[index].quantityoncheckout =
                                                                      a.length - 1;

                                                                  calculateprice();

                                                                  if(type == 'food'){
                                                                    SplashTest.sharedPreferences.setString("cartprice",
                                                                        cartprice.toString());
                                                                    final String
                                                                    encodedData =
                                                                    Products.encodeMusics(globalfoodcart);
                                                                    SplashTest.sharedPreferences.setString("foodcart",
                                                                        encodedData);
                                                                    Food_Home.carttext();
                                                                  }
                                                                  else if(type == 'grocery'){

                                                                    SplashTest.sharedPreferences.setString("grocerycartprice",
                                                                        grocerycartprice.toString());
                                                                    final String
                                                                    encodedData =
                                                                    Products.encodeMusics(globalgrocerycart);
                                                                    SplashTest.sharedPreferences.setString("grocerycart",
                                                                        encodedData);
                                                                    Food_Home.carttext();
                                                                  }
                                                                  else if(type == 'store'){
                                                                    SplashTest.sharedPreferences.setString("storecartprice",
                                                                        storecartprice.toString());
                                                                    final String
                                                                    encodedData =
                                                                    Products.encodeMusics(globalstorecart);
                                                                    SplashTest.sharedPreferences.setString("storecart",
                                                                        encodedData);
                                                                    Food_Home.carttext();
                                                                  }
                                                                  //}
                                                                }),
                                                          )
                                                              : new Container(),
                                                          _filteredList[
                                                          index]
                                                              .orderquantity !=
                                                              0
                                                              ? new Text(_filteredList[
                                                          index]
                                                              .orderquantity
                                                              .toString())
                                                              : new Container(),
                                                          new IconButton(
                                                              icon: new Icon(
                                                                  Icons.add),
                                                              onPressed:
                                                                  () {
                                                                var setcart;

                                                                if(type == 'food'){
                                                                  setcart = globalfoodcart;
                                                                }
                                                                else if(type == 'grocery'){
                                                                  setcart = globalgrocerycart;

                                                                }
                                                                else if(type == 'store'){

                                                                  setcart = globalstorecart;

                                                                }

                                                                if( setcart.isEmpty || setcart[0].vendorid.toString() == vendorid.toString())
                                                                {
                                                                  setState(
                                                                          () {
                                                                        _filteredList[index]
                                                                            .orderquantity++;

                                                                        var a;

                                                                        if(type == 'food'){
                                                                          globalfoodcart
                                                                              .add(_filteredList[index]);

                                                                          a = globalfoodcart.where((element) =>
                                                                          element.id ==
                                                                              _filteredList[index].id);

                                                                        }
                                                                        else if(type == 'grocery'){

                                                                          globalgrocerycart
                                                                              .add(_filteredList[index]);

                                                                          a = globalgrocerycart.where((element) =>
                                                                          element.id ==
                                                                              _filteredList[index].id);
                                                                        }
                                                                        else if(type == 'store'){

                                                                          globalstorecart
                                                                              .add(_filteredList[index]);

                                                                          a = globalstorecart.where((element) =>
                                                                          element.id ==
                                                                              _filteredList[index].id);

                                                                        }

                                                                        if (a.length !=
                                                                            0) {
                                                                          _filteredList[index].quantityoncheckout =
                                                                              a.length;
                                                                        }
                                                                        calculateprice();
                                                                        if(type == 'food'){

                                                                          SplashTest.sharedPreferences.setString(
                                                                              "cartprice",
                                                                              cartprice.toString());

                                                                          final String
                                                                          encodedData =
                                                                          Products.encodeMusics(globalfoodcart);
                                                                          SplashTest.sharedPreferences.setString(
                                                                              "foodcart",
                                                                              encodedData);

                                                                          Food_Home.carttext();
                                                                        }
                                                                        else if(type == 'grocery'){


                                                                          SplashTest.sharedPreferences.setString(
                                                                              "grocerycartprice",
                                                                              grocerycartprice.toString());

                                                                          final String
                                                                          encodedData =
                                                                          Products.encodeMusics(globalgrocerycart);
                                                                          SplashTest.sharedPreferences.setString(
                                                                              "grocerycart",
                                                                              encodedData);

                                                                          Food_Home.carttext();

                                                                        }
                                                                        else if(type == 'store'){


                                                                          SplashTest.sharedPreferences.setString(
                                                                              "storecartprice",
                                                                              storecartprice.toString());

                                                                          final String
                                                                          encodedData =
                                                                          Products.encodeMusics(globalstorecart);
                                                                          SplashTest.sharedPreferences.setString(
                                                                              "storecart",
                                                                              encodedData);

                                                                          Food_Home.carttext();

                                                                        }

                                                                      }
                                                                    //}
                                                                  );
                                                                }
                                                                else{
                                                                  showAlertDialogcart();
                                                                }

                                                              }),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Divider(
                                                thickness: 1,
                                              ),
                                            ],
                                          )),
                                    );
                                  }),
                              onRefresh: _refreshLocalGallery,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              indicatorshow(indicatorvisible),
            ],
          ),
        ),

      ),
      bottomNavigationBar: Container(
        color: Colors.green[400],
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: BottomAppBar(
          color: Colors.transparent,
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              SizedBox(
                width: 20,
              ),

              Food_Home.carttext(),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: InkWell(
                  child: Container(
                    width: 80,
                    height: 35,
                    alignment: Alignment.center,
                    child: Text(
                      'View Cart',
                      style: TextStyle(fontWeight:FontWeight.w400,color: Colors.green),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onTap: () {
                    if (usertoken != null) {
                      showAlertDialog();
                    } else {
                      showAlertDialoglogin();
                    }
                  },
                ),
              )
            ],
          ),
          elevation: 0,
        ),
      ),
    );
  }
  Future<Null> _refreshLocalGallery() async{
    getlist();
    print("hehehheh hahahah");
  }
}