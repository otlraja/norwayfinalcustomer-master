// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// import 'Screen/Food_Profile.dart';
// import 'Screen/foodHome.dart';
// import 'Screen/foodTab.dart';
// import 'Screen/foodcheckout.dart';
// import 'Widget/Component/Color/color.dart';
// import 'Widget/Component/Style/style.dart';
//
//
// class foodNavigation extends StatefulWidget {
//   @override
//   _foodNavigationState createState() => _foodNavigationState();
// }
//
// class _foodNavigationState extends State<foodNavigation> {
//   int _currentIndex = 0;
//   // final List<Widget> _children = [
//   //   // Food_Home(),
//   //   // FoodTab(), //Grocery Orde
//   //   // // rs
//   //   // FoodProfile(), // Grocery earning
//   // ];
//
//   showAlertDialog() {
//     // set up the buttons
//     Widget cancelButton = FlatButton(
//       child: Text("Delivery",style: TextStyle(color: Colors.green)),
//       onPressed:  () {
//         Navigator.of(context)
//             .push(MaterialPageRoute(builder: (_) => FoodCheckout()));
//       },
//     );
//     Widget cancel = FlatButton(
//       child: Text("Cancel",style: TextStyle(color: Colors.red)),
//       onPressed:  () {
//         Navigator.pop(context);
//       },
//     );
//     Widget continueButton = FlatButton(
//       child: Text("Take a Way",style: TextStyle(color: Colors.pinkAccent)),
//       onPressed:  () {
//         Navigator.of(context)
//             .push(MaterialPageRoute(builder: (_) => FoodCheckout()));
//       },
//     );
//     // set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//       title: Text("How Do You Like To Take Order",style: TextStyle(color: Colors.green[300])),
//       actions: [
//         cancelButton,
//         cancel,
//         continueButton,
//       ],
//     );
//     // show the dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Food_Home(),
//         bottomNavigationBar: Container(
//           color: Colors.green[200],
//           height: 60,
//           width: MediaQuery.of(context).size.width,
//           child: BottomAppBar(
//             color: Colors.transparent,
//             child: Row(
//               children: [
//                 SizedBox(width: 20,),
//                 Icon(Icons.shopping_cart,color: Colors.white,),
//                 SizedBox(width: 20,),
//                 Text('Item : 2 | \$ 7.50',style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
//                 SizedBox(width: 80,),
//                 InkWell(
//                   child: Container(
//                     width: 100,
//                     height: 35,
//                     alignment: Alignment.center,
//                     child: Text(
//                       'View Cart',
//                       style: TextStyle(color: Colors.green),
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                   onTap: (){
//                     showAlertDialog();
//
//                   },
//                 )
//               ],
//             ),
//             elevation: 0,
//           ),
//         ),
//     );
//   }
// }
