import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:norwayfinalcustomer/foodModule/Screen/foodNewOrder/RidersDetails.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/Component/Style/style.dart';


import '../foodcheckout.dart';
import 'foodPastOrdersDetails.dart';

class FoodPastOrdersCard extends StatefulWidget {
  final FoodPastOrders foodPastOrders;
  final int ind;

  const FoodPastOrdersCard({Key key, this.ind, this.foodPastOrders})
      : super(key: key);

  @override
  FoodPastOrderscards createState() => FoodPastOrderscards(this.foodPastOrders);
}

class FoodPastOrderscards extends State<FoodPastOrdersCard> {
  final FoodPastOrders foodPastOrders;

  @override
  void initState() {
    // TODO: implement initState

    // img(image);

    super.initState();
    //img(image);
  }

  FoodPastOrderscards(this.foodPastOrders);
  String img(image) {
    return image;
  }

  Function ontap() {
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (_) => Ridersdetail()));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var _counter;
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: InkWell(
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(0.0),
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
                      child: foodPastOrders.image != null ?
                      Image.network(
                        foodPastOrders.image.toString(),
                        fit: BoxFit.fill,
                      ):
                      Image.asset(
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
                            foodPastOrders.name,
                            style: AppFonts.monmbold,
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: <Widget>[
                            Text('\$ ', style: AppFonts.monmbold),
                            Text(
                              foodPastOrders.price.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
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
                              foodPastOrders.date,
                              style: AppFonts.monmgrey,
                            ),
                          ),
                          Spacer(),
                          Container(
                            // width: 20,
                            height: 20,
                            child: Text(
                              foodPastOrders.payment,
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
                                child: Text(
                                  (foodPastOrders.orderNo.toString()),
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
                                foodPastOrders.items.toString(),
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
                            foodPastOrders.status.toString(),
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontFamily: 'monm',
                                fontWeight: FontWeight.bold,
                                color: Colors.green[900],
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
