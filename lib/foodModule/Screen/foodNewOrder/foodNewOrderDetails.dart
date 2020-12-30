import 'package:flutter/material.dart';

class FoodNewOrder {
  var image;
  String name;
  double price;
  String date;
  String payment;
  int orderNo;
  var items;
  var status;
  var userlat;
  var userlng;
  var useraddr;
  var venlat;
  var venlng;
  var venadd;
  var venimg;
  var venname;
  var instr;
  var tax;

  FoodNewOrder({this.image, this.name, this.price, this.date, this.payment,
      this.orderNo, this.items, this.status, this.useraddr, this.userlat, this.userlng , this.venadd,
  this.venimg, this.venlat, this.venlng,this.venname,this.instr, this.tax});
}

// List<FoodNewOrder> foodNewOrder = [
//   FoodNewOrder(
//     'assets/foodVector2.png',
//     'Zinger Burger',
//     22.00,
//     '20 jun, 11:35 am',
//     'Cash on delivery',
//     244450,
//     4,
//   ),
//   FoodNewOrder(
//     'assets/foodVector2.png',
//     'Quadera Burger',
//     12.50,
//     '20 jun, 11:35 am',
//     'PayPal',
//     202035,
//     2,
//   ),
//   FoodNewOrder(
//     'assets/foodVector2.png',
//     'Sizzler',
//     40.00,
//     '20 jun, 11:35 am',
//     'Credit Card',
//     256354,
//     3,
//   ),
//   FoodNewOrder(
//     'assets/foodVector2.png',
//     'Salad',
//     22.00,
//     '20 jun, 11:35 am',
//     'Cash on delivery',
//     244450,
//     2,
//   ),
//   FoodNewOrder(
//     'assets/foodVector2.png',
//     'Anda Wala Burger',
//     22.00,
//     '20 jun, 11:35 am',
//     'Cash on delivery',
//     888121,
//     5,
//   ),
//   FoodNewOrder(
//     'assets/foodVector2.png',
//     'Chapli Kabab',
//     40.00,
//     '20 jun, 11:35 am',
//     'Credit Card',
//     256354,
//     3,
//   ),
// ];
