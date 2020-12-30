import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/Component/Style/style.dart';



import 'foodEarning.dart';
//import 'package:norway_service_provider/Model/AppointmentCard/Appointment.dart';

class foodEarningCard extends StatefulWidget {
  final foodEarnings foodearnings;
  final int ind;

  const foodEarningCard({Key key, this.ind, this.foodearnings})
      : super(key: key);
  @override
  FoodEarningCards createState() => FoodEarningCards(this.foodearnings);
}

class FoodEarningCards extends State<foodEarningCard> {
  final foodEarnings foodearnings;

  @override
  void initState() {
    // TODO: implement initState

    // img(image);

    super.initState();
    //img(image);
  }

  FoodEarningCards(this.foodearnings);

  String img(image) {
    return image;
  }

//  Function ontap(){
//    Navigator.of(context).push(MaterialPageRoute(builder:(_)=>check()));
//  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 1, 0, 5),
        //  padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
            color: Colors.white,
            // height: MediaQuery.of(context).size.height / 5,
            // width: MediaQuery.of(context).size.width / 1.2,
            child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Text(
                              foodearnings.name,
                              style: AppFonts.monm15bold,
                            ),
                          ),
                          Spacer(),
                          Container(
                              width: 53,
                              child: Text(
                                foodearnings.payment,
                                style: AppFonts.monm,
                              )),
                          Container(
                            width: 55,
                            child: Text(
                              foodearnings.earningpayment,
                              style: AppFonts.monm,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                child: Text(
                              foodearnings.items,
                              style: AppFonts.monmgrey12,
                            )),
                            Container(
                              height: 10,
                              child: VerticalDivider(
                                color: Colors.grey,
                                thickness: 0.5,
                              ),
                            ),
                            Container(
                                child: Text(
                              foodearnings.date,
                              style: AppFonts.monmgrey12,
                            )),
                            Container(
                              child: Text(
                                '|',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Container(
                                width: 50,
                                child: Text(
                                  foodearnings.time,
                                  style: AppFonts.monmgrey12,
                                )),
                            Spacer(),
                            Container(
                                width: 50,
                                child: Text(
                                  foodearnings.distance,
                                  style: AppFonts.monmgrey12,
                                )),
                            Container(
                              width: 60,
                              child: Text(
                                foodearnings.amount,
                                style: AppFonts.monmgrey12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Divider(),
                      // Row(
                      //   children: [
                      //     Container(
                      //       padding: EdgeInsets.only(top: 5, left: 0),
                      //       child: Column(
                      //         children: <Widget>[
                      //           Text(
                      //             'Pickup ',
                      //             style: TextStyle(
                      //                 fontSize: 15,
                      //                 fontWeight: FontWeight.w600),
                      //           ),
                      //           SizedBox(
                      //             height: 5,
                      //           ),
                      //           Text(
                      //             groceryearnings.pick_address,
                      //             style: TextStyle(fontSize: 12),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     Spacer(),
                      //     Container(
                      //       padding: EdgeInsets.only(top: 10),
                      //       child: Column(
                      //         children: <Widget>[
                      //           Text(
                      //             'Drop off',
                      //             style: TextStyle(
                      //                 fontSize: 15,
                      //                 fontWeight: FontWeight.w600),
                      //           ),
                      //           SizedBox(
                      //             height: 5,
                      //           ),
                      //           Text(
                      //             groceryearnings.drop_address,
                      //             style: TextStyle(fontSize: 12),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ]))));
  }
}
