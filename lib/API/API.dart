
import 'package:dio/dio.dart';
import 'package:norwayfinalcustomer/Models/adduserlocation.dart';
import 'package:norwayfinalcustomer/Models/foodvendorsmodel.dart';
import 'package:norwayfinalcustomer/Models/products.dart';
import 'package:norwayfinalcustomer/foodModule/MOdel/FoodReviews/foodreviewmodel.dart';
import 'package:norwayfinalcustomer/foodModule/Screen/foodNewOrder/foodNewOrderDetails.dart';
import 'package:norwayfinalcustomer/foodModule/Screen/foodPastOrders/foodPastOrdersDetails.dart';
import 'package:norwayfinalcustomer/foodModule/inprogressfood/inprogressfoodorders.dart';
import '../global.dart';
import '../Models/productType.dart';
import '../main.dart';
import '../testSplash.dart';

class API {
  static var success = "false";
  static var items1;

  static checkout(
      var url,
      var userId,
      var vendorId,
      var totalPrice,
      var tax,
      var instruction,
      var paymentMethod,
      var cardNumber,
      var expiryMonth,
      var expiryYear,
      var cvc,
      var items,
      var rider_type,
      var lat,
      var lng,
      var addr) {
    items1 = new List();
    items1 = items;
    success = "false";
    Dio dio = new Dio();

    FormData formData = new FormData.fromMap({
      'user_id': userId,
      'total_price': totalPrice,
      'tax': tax,
      'instruction': instruction,
      'payment_method': paymentMethod,
      'card_number': cardNumber,
      'expiry_month': expiryMonth,
      'expiry_year': expiryYear,
      'cvc': cvc,
      'items': Products.encodeMusics(newglobalfoodcart),
      'vendor_id': vendorId,
      'rider_type': rider_type,
      'latitude': lat,
      'longitude': lng,
      'address': addr,
    });
    dio
        .post(
      url,
      data: formData,
      options: Options(
        contentType: "application/json",
      ),
    )
        .then((response) {
          print(response);
      Map<String, dynamic> data = response.data;
      if (response.statusCode == 200) {

        print(data);
        success = "true";
      }
      else{
        print(response.statusCode );
      }

      //print(response.data);
    }).catchError(_handleDioErrorsignup);
  }

  static login(
    var url,
    var email,
    var pass,
  ) {
    success = "false";
    Dio dio = new Dio();

    FormData formData = new FormData.fromMap({
      'email': email,
      'password': pass,
    });
    dio
        .post(
      url,
      data: formData,
      options: Options(
        contentType: "application/json",
        // headers: {
        //   "Content-Type": " application/json"
        // },
      ),
    )
        .then((response) {
      Map<String, dynamic> data = response.data;
      var status = data['success'];

      if (response.statusCode == 200) {
        if (status != null) {
          usertoken = data['success']['token'];

          var user = data['success']['user']['detail'];
          username = user['user_name'];
          useremail = user['email'];
          userid = user['user_id'].toString();
          userphone = user['phone'];
          userimage = user['image'].toString();
          SplashTest.sharedPreferences.setString("usertoken", usertoken.toString());
          SplashTest.sharedPreferences.setString("username", username.toString());
          SplashTest.sharedPreferences.setString("useremail", useremail.toString());
          SplashTest.sharedPreferences.setString("userid", userid.toString());
          SplashTest.sharedPreferences.setString("userphone", userphone.toString());
          SplashTest.sharedPreferences.setString("userimage", userimage.toString());

          success = "true";
          print('done');
        } else {
          success = "error";
          print('error');
        }
      } else {
        success = "error";
        throw Exception('Failed to Fetch Vendors');
      }
    }).catchError(_handleDioErrorsignup);
  }

  static adduserloc(
      var url,
      var title,
      var address,
      var latitude,
      var longitude,
      var user_id,
      ) {
    success = "false";
    Dio dio = new Dio();

    FormData formData = new FormData.fromMap({
      'title': title,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'user_id': user_id,
    });
    dio
        .post(
      url,
      data: formData,
      options: Options(
        contentType: "application/json",
        // headers: {
        //   "Content-Type": " application/json"
        // },
      ),
    )
        .then((response) {
      globaluserlocation.clear();
      Map<String, dynamic> data = response.data;


        if (response.statusCode == 200) {
          var records = data['success']['records'];
          for (Map i in records){

            globaluserlocation.add(userlocation(
              id: i['id'],
              address: i['address'],
              latitude: i['latitude'],
              longitude:i['longitude'] ,
              title: i['title'],
              unique: (i['address'].toString()+i['latitude'].toString()+i['longitude'].toString()+i['title'].toString()+i['id'].toString()),
              selected: -1,
            ));

            success = "true";
            print('done');
          }
      } else {
        success = "error";
        internetspeedtoast();
        throw Exception('Failed to Fetch Vendors');
      }
    }).catchError(_handleDioErrorsignup);
  }

  static getuseloc(var url){
    success = "false";
    Dio dio = new Dio();


    dio.get(url).then((response) {
      if (response.statusCode == 200) {
        globaluserlocation.clear();
        Map<String, dynamic> data = response.data;
        var records = data['success']['records'];
        for (Map i in records) {

          globaluserlocation.add(userlocation(
            id: i['id'],
            address: i['address'],
            latitude: i['latitude'],
            longitude:i['longitude'] ,
            title: i['title'],
            unique: (i['address'].toString()+i['latitude'].toString()+i['longitude'].toString()+i['title'].toString()+i['id'].toString()),
            selected: -1,
          ));
          success = "true";
        }

      }
    }).catchError(_handleDioError);

  }

  static deleteuserloc(var url){
    success = "false";
    Dio dio = new Dio();


    dio.get(url).then((response) {
      if (response.statusCode == 200) {
        globaluserlocation.clear();
        Map<String, dynamic> data = response.data;
        var records = data['success']['records'];
        for (Map i in records) {

          globaluserlocation.add(userlocation(
            id: i['id'],
            address: i['address'],
            latitude: i['latitude'],
            longitude:i['longitude'] ,
            title: i['title'],
            unique: (i['address'].toString()+i['latitude'].toString()+i['longitude'].toString()+i['title'].toString()+i['id'].toString()),
            selected: -1,
          ));
          success = "true";
        }

      }
    }).catchError(_handleDioError);
  }

  static signup(var url, var name, var email, var pass, var phone) {
    success = "false";
    Dio dio = new Dio();
    //dio.options.headers['Content-Type'] = 'application/json';
    //dio.options.headers["authorization"] = "token ${token}";
    FormData formData = new FormData.fromMap({
      'name': name,
      'phone': phone,
      'email': email,
      'password': pass,
    });
    dio
        .post(
      url,
      data: formData,
      options: Options(
        contentType: "application/json",
      ),
    )
        .then((response) {
      Map<String, dynamic> data = response.data;
      var status = data['success'];

      if (response.statusCode == 200) {
        if (status != null) {
          success = "true";
          print('done');
        } else {
          success = "error";
          print('error');
        }
      } else {
        success = "error";
        throw Exception('Failed to Fetch Vendors');
      }
    }).catchError(_handleDioErrorsignup);
  }


  static profileedit(var url, var name, var pass, var phone, var image) async {
    success = "false";
    Dio dio = new Dio();
    //dio.options.headers['Content-Type'] = 'application/json';
    //dio.options.headers["authorization"] = "token ${token}";
    FormData formData = new FormData.fromMap({
      'name': name,
      'phone': phone,
      'password': pass,
      "image": image != null
          ? await MultipartFile.fromFile(image.path,
              filename: image.path.split('/').last)
          : image,
    });
    dio
        .post(
      url,
      data: formData,
      options: Options(
        contentType: "application/json",
      ),
    )
        .then((response) {
      Map<String, dynamic> data = response.data;
      var status = data['success'];

      var user = data['success']['detail'];
      username = user['user_name'];
      useremail = user['email'];
      userid = user['user_id'].toString();
      userphone = user['phone'];
      userimage = user['image'].toString();
      SplashTest.sharedPreferences.setString("usertoken", usertoken.toString());
      SplashTest.sharedPreferences.setString("username", username.toString());
      SplashTest.sharedPreferences.setString("useremail", useremail.toString());
      SplashTest.sharedPreferences.setString("userid", userid.toString());
      SplashTest.sharedPreferences.setString("userphone", userphone.toString());
      SplashTest.sharedPreferences.setString("userimage", userimage.toString());

      success = "true";
    }).catchError(_handleDioErrorsignup);
  }

  static allfoodvendors(var vendorUrl) {
    success = "false";
    globalvendors.clear();
    Dio dio = new Dio();
    dio.get(vendorUrl).then((response) {
      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        var records = data['success']['records'];

        for (Map i in records) {
          print(i['locations']);
          var loc = i['locations'];
          var add , la, ln;
          for(Map j in loc){
            add = j['address'].toString();
            la = j['latitude'].toString();
            ln = j['longitude'].toString();
          }
          if (i['detail']['status'] == 1) {
            globalvendors.add(FoodVendors(
              id: i['id'],
              image: i['detail']["image"],
              name: i['name'],
              address: add.toString(),
              totalReviews: i['totalReviews'],
              avgRating: i['avgRating'],
              lat: la.toString(),
              lng: ln.toString(),
            ));
          }
        }
        success = "true";
      } else {
        success = "true";
        throw Exception('Failed to Fetch Vendors');
      }
    });
  }

  static orderinprogessfood(var url, var type) {
    success = "false";
    Dio dio = new Dio();
    dio.get(url).then((response) {
      if (response.statusCode == 200) {
        globalorderinprogressfood.clear();
        Map<String, dynamic> data = response.data;
        var records = data['success'];
        for (Map i in records) {
          var payment;
          var loc = i['details']['vendor']['locations'];
          var add , la, ln;
          for(Map j in loc){
            add = j['address'].toString();
            la = j['latitude'].toString();
            ln = j['longitude'].toString();
          }
          if (i['payment_method'] == 'cod') {
            payment = 'Cash on delivery';
          } else if (i['payment_method'] == 'card') {
            payment = 'Credit Card';
          } else {
            payment = 'Cash on delivery';
          }
          globalorderinprogressfood.add(FoodNewOrder(
              orderNo: i['id'],
              price: i['total_price'],
              image: i['details'][type]['image'],
              status: i['status'],
              date: i['created_at'],
              items: i['details']['quantity'],
              name: i['details'][type]['name'],
              payment: payment,
              useraddr: i['address'],
              userlat: i['latitude'],
              userlng: i['longitude'],
              venadd: add,
              venimg: i['details']['vendor']['detail']['image'],
              venlat: la,
              venlng: ln,
              venname: i['details']['vendor']['name'],
              instr: i['instruction'],
              tax: i['tax'],
          ));
        }
        success = "true";
      } else {
        success = "true";
        throw Exception('Failed to Fetch inprogress orders');
      }
    }).catchError(_handleDioError);
  }

  static comleteorder(var url) {
    success = "false";

    Dio dio = new Dio();
    dio.get(url).then((response) {
      if (response.statusCode == 200) {
        globalcompleteorder.clear();
        Map<String, dynamic> data = response.data;
        var records = data['success'];
        for (Map i in records) {
          globalcompleteorder.add(FoodPastOrders(
              orderNo: i['id'],
              price: i['total_price'],
              image: i['details']['food']['image'],
              status: i['status'],
              date: i['created_at'],
              items: i['details']['quantity'],
              name: i['details']['food']['name'],
              payment: "Cash on delivery"));
        }
        success = "true";
      } else {
        internetspeedtoast();
        success = "true";
        throw Exception('Failed to Fetch inprogress orders');
      }
    }).catchError(_handleDioError);
  }

  static vendorProducts(var vendorUrl) async {
    print(vendorUrl);
    success = "false";
    Dio dio = new Dio();

    dio.get(vendorUrl).then((response) {
      globalproductType.clear();
      if (response.statusCode == 200) {
        globalproductType.clear();
        Map<String, dynamic> data = response.data;
        if (data['error'] != null) {
          success = 'true';
        } else {
          var records = data['success']['records'];
          var vendorid = data['success']['shop']['id'];
          var vendorname = data['success']['shop']['name'];

          for (Map i in records) {
            globalproduct = new List();
            for (Map j in i['products']) {
              globalproduct.add(Products(
                id: j['id'],
                name: j['name'],
                image: j['image'],
                price: j['price'],
                quantity: j['quantity'],
                orderquantity: 0,
                vendorid: vendorid,
                vendorname: vendorname,
              ));
            }
            globalproductType.add(ProductType(
              name: i['name'],
              id: i['id'],
              product: globalproduct,
              vendorId: vendorid.toString(),
              vendorname: vendorname,
            ));
          }
        }
        success = "true";
      } else {
        internetspeedtoast();
        success = "true";
        throw Exception('Failed to Fetch Vendors Products');
      }
    }).catchError(_handleDioError);
  }

  static vendorreviews(var vendorUrl) async {
    print(vendorUrl);
    success = "false";
    Dio dio = new Dio();

    dio.get(vendorUrl).then((response) {

      if (response.statusCode == 200) {
        Foodreview.clear();
        Map<String, dynamic> data = response.data;
        var records = data['success']['records'];
        for (Map i in records) {
          // var name;
          // for(Map j in i['user']){
          //   name = j["name"];
          // }
          Foodreview.add(FoodReviewmodel(
            name: i['user']['name'],
            date: i['created_at'],
            message: i['reviews'],
            rate: i['rating'],
          ));
        }
        success = "true";
      } else {
        success = "true";
        internetspeedtoast();
        throw Exception('Failed to Fetch Vendors Products');
      }
    }).catchError(_handleDioError);
  }

  static _handleDioError(dynamic error) {
    success = "true";
    throw Exception('Failed to Fetch Vendors Products');
  }

  static _handleDioErrorsignup(dynamic error) {
    success = "error";
    throw Exception('Failed to Fetch Vendors Products');
  }
}
