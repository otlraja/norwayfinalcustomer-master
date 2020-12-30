import 'package:flutter/material.dart';

class FoodPastOrders {
  var image;
  String name;
  double price;
  String date;
  String payment;
  int orderNo;
  var items;
  var status;

  FoodPastOrders({this.image, this.name, this.price, this.date, this.payment,
      this.orderNo, this.items, this.status});
}

// List<FoodPastOrders> foodPastOrders = [
//   FoodPastOrders(
//     'assets/foodVector2.png',
//     'Zinger Burger',
//     22.00,
//     '20 jun, 11:35 am',
//     'Cash on delivery',
//     244,
//     2,
//   ),
//   FoodPastOrders(
//     'assets/foodVector2.png',
//     'Quadera Burger',
//     22.00,
//     '20 jun, 11:35 am',
//     'Cash on delivery',
//     244450,
//     4,
//   ),
//   FoodPastOrders(
//     'assets/foodVector2.png',
//     'Sizzler',
//     12.50,
//     '20 jun, 11:35 am',
//     'PayPAl',
//     202035,
//     2,
//   ),
//   FoodPastOrders(
//     'assets/foodVector2.png',
//     'Salad',
//     40.00,
//     '20 jun, 11:35 am',
//     'Credit Card',
//     256354,
//     3,
//   ),
//   FoodPastOrders(
//     'assets/foodVector2.png',
//     'Anda Wala Burger',
//     22.00,
//     '20 jun, 11:35 am',
//     'Cash on delivery',
//     244456,
//     2,
//   ),
//   FoodPastOrders(
//     'assets/foodVector2.png',
//     'Chapli Kabab',
//     22.00,
//     '20 jun, 11:35 am',
//     'Cash on delivery',
//     244456,
//     2,
//   ),
//   FoodPastOrders(
//     'assets/foodVector2.png',
//     'Chapli Kabab',
//     22.00,
//     '20 jun, 11:35 am',
//     'Cash on delivery',
//     244560,
//     2,
//   ),
// ];
