import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import 'package:norwayfinalcustomer/foodModule/Widget/Component/Style/style.dart';



import '../foodcheckout.dart';
import 'RidersDetails.dart';
import 'foodNewOrderDetails.dart';

class FoodNewOrderCard extends StatefulWidget {
  final FoodNewOrder foodNewOrder;
  final int ind;

  const FoodNewOrderCard({Key key, this.ind, this.foodNewOrder})
      : super(key: key);

  @override
  FoodNewOrdercards createState() => FoodNewOrdercards(this.foodNewOrder);
}

class FoodNewOrdercards extends State<FoodNewOrderCard> {
  final FoodNewOrder foodNewOrder;

  @override
  void initState() {
    // TODO: implement initState

    // img(image);

    super.initState();
    //img(image);
  }

  FoodNewOrdercards(this.foodNewOrder);
  String img(image) {
    return image;
  }

  // Function ontap() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => Ridersdetail()),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var _counter;
    return Padding(
      padding: const EdgeInsets.only(bottom: 6,left: 5,right: 5),
      child: InkWell(
        // onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          width: size.width,
          height: size.height / 7.4,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Container(
                    height: size.height / 14,
                    width: size.width / 6,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: foodNewOrder.image != null ?
                      Image.network(
                        foodNewOrder.image.toString(),

                      ): Image.asset(
                        'assets/foodVector2.png',
                        fit: BoxFit.fill,
                      ),
                    )),
              ),
              Container(
                width: size.width / 1.25,
                height: size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: size.width / 2.5,
                          child: Text(
                            foodNewOrder.name,
                            style: AppFonts.monm,
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: <Widget>[
                            Text('\$ ', style: AppFonts.monmbold),
                            Text(
                              foodNewOrder.price.toString(),
                              style: AppFonts.monmbold,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      // width: size.width / 1.7,
                      child: Row(
                        children: <Widget>[
                          Container(

                            height: 20,
                            child: Text(
                              foodNewOrder.date,
                              style: AppFonts.monmgrey,
                            ),
                          ),
                          Spacer(),
                          Container(
                            // width: 20,
                            height: 20,
                            child: Text(
                              foodNewOrder.payment,
                              style: AppFonts.monmgrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 1,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          height: 17,
                          width: size.width / 2.37,
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Order num ',
                                style: AppFonts.monmbold12,
                              ),
                              Container(
                                width: size.width / 7.2,
                                height: 17,
                                child: Text(
                                  (foodNewOrder.orderNo.toString()),
                                  style: AppFonts.monmbold12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: size.width / 5.3,
                          height: 17,
                          child: Row(
                            children: <Widget>[
                              Text(
                                foodNewOrder.items.toString(),
                                style: AppFonts.monmbold12,
                              ),
                              Text(
                                ' items',
                                style: AppFonts.monmbold12,
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: size.width / 5.5,
                          height: 17,
                          child: Text(
                            foodNewOrder.status.toString(),
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontFamily: 'monm',
                                fontWeight: FontWeight.bold,
                                color: Colors.green[500],
                                fontSize: 12),
                          ),
                        ),

                        //Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
