import 'package:credit_card/credit_card_model.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:norwayfinalcustomer/main.dart';
import 'package:norwayfinalcustomer/testSplash.dart';
import 'Models/adduserlocation.dart';
import 'Models/credit_card_model.dart';
import 'Models/foodvendorsmodel.dart';
import 'Models/productType.dart';
import 'Models/products.dart';
import 'foodModule/MOdel/FoodReviews/foodreviewmodel.dart';
import 'foodModule/Screen/foodNewOrder/foodNewOrderDetails.dart';
import 'foodModule/Screen/foodPastOrders/foodPastOrdersDetails.dart';
import 'foodModule/inprogressfood/inprogressfoodorders.dart';
import 'main.dart';

Widget indicatorshow(var bool){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Visibility(
      visible: bool,
      child: Align(
          alignment: Alignment.bottomCenter,
          child: LinearProgressIndicator(
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation(Colors.green),
            minHeight: 4,
          )
      ),
    ),
  );
}

bool result;
checkconnection() async{
  result = await DataConnectionChecker().hasConnection;
  if(result == true) {
    print('YAY! Free cute dog pics!');
    result = true;
  } else {
    print('No internet :( Reason:');
    result = false;
    print(DataConnectionChecker().lastTryResults);
  }
}

internettoast(){
  Fluttertoast.showToast(
      msg: "'No internet :( Reason:'",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}

internetspeedtoast(){
  Fluttertoast.showToast(
      msg: "'No internet Speed :( Reason:'",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}


var userid=SplashTest.sharedPreferences.getString("userid");
var usertoken=SplashTest.sharedPreferences.getString("usertoken");
var username=SplashTest.sharedPreferences.getString("username");
var useremail=SplashTest.sharedPreferences.getString("useremail");
var userphone=SplashTest.sharedPreferences.getString("userphone");
var userimage = SplashTest.sharedPreferences.getString("userimage");
var userpass;

var type = "food";

var baseUrl = "http://akbooker.com/admin/public/api/";
var foodinprogress=baseUrl+"userfoodbooking/inprogressOrders/";
var groceryinprogress=baseUrl+"usergrocerybooking/inprogressOrders/";
var storeinprogress=baseUrl+"userstorebooking/inprogressOrders/";

var foodcomplete=baseUrl+"userfoodbooking/completedOrders/";
var grocerycomplete=baseUrl+"usergrocerybooking/completedOrders/";
var storecomplete=baseUrl+"userstorebooking/completedOrders/";


var signupAPI = baseUrl+"signup";
var loginAPI = baseUrl+"login";
var editprofileAPI = baseUrl+"useredit/";

var adduserlocAPI=baseUrl+"userlocationstore/";
var getuserlocAPI=baseUrl+"userlocationshow/";
var deluserlocAPI=baseUrl+"userlocationdelete/";

var FoodvendorAPI = baseUrl+"foodvendors";
var FoodproductApi = baseUrl+"food/";

var GroceryvendorAPI = baseUrl+"groceryvendors";
var GroceryProductApi = baseUrl+"grocery/";

var StorevendorAPI = baseUrl+"storevendors";
var StoreProductApi = baseUrl+"store/";

var vendorreviewsAPI = baseUrl+"foodvendorreview/";
var groceryvendorreviewsAPI = baseUrl+"groceryvendorreview/";
var storevendorreviewsAPI = baseUrl+"storevendorreview/";

var foodcheckoutAPI = baseUrl+"foodCheckout";
var grocerycheckoutAPI = baseUrl+"groceryCheckout";
var storecheckoutAPI = baseUrl+"storeCheckout";

List<FoodVendors> globalvendors = new List();
List<ProductType> globalproductType = new List();
List<Products> globalproduct = new List();
List<FoodReviewmodel> Foodreview = new List();
List<CreditCardModel> credit = CreditCardModel.decodeMusics(SplashTest.sharedPreferences.getString("creditcard"));
List<Products> globalfoodcart = Products.decodeMusics(SplashTest.sharedPreferences.getString("foodcart"));
List<Products> globalgrocerycart = Products.decodeMusics(SplashTest.sharedPreferences.getString("grocerycart"));
List<Products> globalstorecart = Products.decodeMusics(SplashTest.sharedPreferences.getString("storecart"));
List<Products> newglobalfoodcart = new List();
List<FoodNewOrder> globalorderinprogressfood = new List();
List<FoodPastOrders> globalcompleteorder = new List();
List<userlocation> globaluserlocation=new List();

var vendorname = 'abc';
var vendoraddress;
var vendorid;
var vendoridcheck;
var sales_tax=1.50;
var deliverytype="AK Bookers Rides";
var selectedcardindex = SplashTest.sharedPreferences.getString("selectedcardindex");
var selectpaymenttype = "cash";
var indexx;
var credircardbuttontex = "Add Card";

var usercurrlat;
var usercurrlng;
var usercurraddr;

var userselectlat;
var userselectlng;
var userselectadd;
var vendordistance;
var vendortime;



var cartprice = double.parse(SplashTest.sharedPreferences.getString("cartprice") == null ? '0.0' : SplashTest.sharedPreferences.getString("cartprice"));
var grocerycartprice = double.parse(SplashTest.sharedPreferences.getString("grocerycartprice")== null ? '0.0' : SplashTest.sharedPreferences.getString("grocerycartprice"));
var storecartprice = double.parse(SplashTest.sharedPreferences.getString("storecartprice")== null ? '0.0' : SplashTest.sharedPreferences.getString("storecartprice"));




