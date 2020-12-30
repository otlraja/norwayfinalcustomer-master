import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:norwayfinalcustomer/foodModule/Screen/Foodviewmsg.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/Component/Style/style.dart';


import 'foodmsg.dart';

//import 'package:norway_service_provider/Model/AppointmentCard/Appointment.dart';

class foodMsgCard extends StatefulWidget {
  final foodsMsgs foodmsgs;
  final int ind;

  const foodMsgCard({Key key, this.ind, this.foodmsgs}) : super(key: key);
  @override
  FoodMsgCards createState() => FoodMsgCards(this.foodmsgs);
}

class FoodMsgCards extends State<foodMsgCard> {
  final foodsMsgs foodmsgs;
  @override
  void initState() {
    // TODO: implement initState

    // img(image);

    super.initState();
    //img(image);
  }

  FoodMsgCards(this.foodmsgs);
  String img(image) {
    return image;
  }

  Function ontap() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => Foodviewmsg()));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: InkWell(
        onTap: ontap,
        child: Container(
          height: size.height / 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 70,
                    child: CircleAvatar(
                      child: Image.asset(foodmsgs.img),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: size.width / 1.4,
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Text(
                                foodmsgs.name,
                                style: AppFonts.monmbold20,
                              ),
                            ),
                            Spacer(),
                            Container(
                              child: Text(
                                foodmsgs.time,
                                style: AppFonts.monmgrey,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 260,
                        child: Text(
                          foodmsgs.description,
                          style: AppFonts.monm,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  // return Padding(
  //     padding: EdgeInsets.fromLTRB(0, 1, 0, 5),
  //     //  padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //     child: Container(
  //         color: Colors.white,
  //         // height: MediaQuery.of(context).size.height / 5,
  //         // width: MediaQuery.of(context).size.width / 1.2,
  //         child: Padding(
  //             padding: const EdgeInsets.all(5),
  //             child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: <Widget>[
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                     children: [
  //                       Container(
  //                         height: 20,
  //                         width: 20,
  //                         decoration: BoxDecoration(
  //                             image: DecorationImage(
  //                           image: AssetImage(
  //                             shopmsgs.img,
  //                           ),
  //                         )),
  //                       ),
  //
  //                       Column(
  //                         children: <Widget>[
  //                           Row(
  //                             children: <Widget>[
  //                               Container(
  //                                 child: Text(
  //                                   shopmsgs.name,
  //                                   style: TextStyle(
  //                                       fontSize: 15,
  //                                       fontWeight: FontWeight.w700,
  //                                       fontFamily: 'monm'),
  //                                 ),
  //                               ),
  //                               Container(
  //                                 width: 55,
  //                                 child: Text(
  //                                   shopmsgs.time,
  //                                   style: AppFonts.monm,
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                           Container(
  //                               width: 53,
  //                               child: Text(
  //                                 shopmsgs.description,
  //                                 style: AppFonts.monm,
  //                               )),
  //                         ],
  //                       ),
  //                       // Spacer(),
  //                     ],
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.only(top: 3),
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                       children: [
  //                         Container(
  //                             child: Text(
  //                           shopmsgs.description,
  //                           style: AppFonts.monmgrey12,
  //                         )),
  //                         Container(
  //                           height: 10,
  //                           child: VerticalDivider(
  //                             color: Colors.grey,
  //                             thickness: 0.5,
  //                           ),
  //                         ),
  //
  //                         // Spacer(),
  //                         // Container(
  //                         //     width: 50,
  //                         //     child: Text(
  //                         //       shopearnings.distance,
  //                         //       style: AppFonts.monmgrey12,
  //                         //     )),
  //                         // Container(
  //                         //   width: 60,
  //                         //   child: Text(
  //                         //     shopearnings.amount,
  //                         //     style: AppFonts.monmgrey12,
  //                         //   ),
  //                         // ),
  //                       ],
  //                     ),
  //                   ),
  //                   // Divider(),
  //                   // Row(
  //                   //   children: [
  //                   //     Container(
  //                   //       padding: EdgeInsets.only(top: 5, left: 0),
  //                   //       child: Column(
  //                   //         children: <Widget>[
  //                   //           Text(
  //                   //             'Pickup ',
  //                   //             style: TextStyle(
  //                   //                 fontSize: 15,
  //                   //                 fontWeight: FontWeight.w600),
  //                   //           ),
  //                   //           SizedBox(
  //                   //             height: 5,
  //                   //           ),
  //                   //           Text(
  //                   //             groceryearnings.pick_address,
  //                   //             style: TextStyle(fontSize: 12),
  //                   //           ),
  //                   //         ],
  //                   //       ),
  //                   //     ),
  //                   //     Spacer(),
  //                   //     Container(
  //                   //       padding: EdgeInsets.only(top: 10),
  //                   //       child: Column(
  //                   //         children: <Widget>[
  //                   //           Text(
  //                   //             'Drop off',
  //                   //             style: TextStyle(
  //                   //                 fontSize: 15,
  //                   //                 fontWeight: FontWeight.w600),
  //                   //           ),
  //                   //           SizedBox(
  //                   //             height: 5,
  //                   //           ),
  //                   //           Text(
  //                   //             groceryearnings.drop_address,
  //                   //             style: TextStyle(fontSize: 12),
  //                   //           ),
  //                   //         ],
  //                   //       ),
  //                   //     ),
  //                   //   ],
  //                   // ),
  //                 ]))));
}
