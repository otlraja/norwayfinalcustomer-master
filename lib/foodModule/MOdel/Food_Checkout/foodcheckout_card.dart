import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/Component/Style/style.dart';




class FoodCheckOutCard extends StatefulWidget {
  final foodcheckoutt;
  final int ind;

  const FoodCheckOutCard({Key key, this.ind, this.foodcheckoutt})
      : super(key: key);
  @override
  FoodCheckOutCards createState() => FoodCheckOutCards(this.foodcheckoutt);
}

class FoodCheckOutCards extends State<FoodCheckOutCard> {
  final foodcheckoutt;
  @override
  void initState() {
    // TODO: implement initState

    // img(image);

    super.initState();
    //img(image);
  }

  FoodCheckOutCards(this.foodcheckoutt);
  String img(image) {
    return image;
  }

//  Function ontap(){
//    Navigator.of(context).push(MaterialPageRoute(builder:(_)=>check()));
//  }
  @override
  Widget build(BuildContext context) {

    return Container(

      child: Column(
        children: <Widget>[
          Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        height: 40,
                        child: Text(
                          'ITEMS',
                          style: AppFonts.monmgreybold12,
                        ),
                      ),
                    ),

                    Container(
                      height: 140,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: foodcheckoutt.length,
                          itemBuilder: (_, index) {

                            return Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      foodcheckoutt[index].name,
                                      style: AppFonts.monmgrey12,
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          foodcheckoutt[index].quantityoncheckout.toString(),
                                        ),
                                        Container(
                                          child: Spacer(),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 15),
                                          child: Text(
                                            (double.parse(foodcheckoutt[index].price.toString())*(double.parse(foodcheckoutt[index].quantityoncheckout.toString()))).toString() ,
                                            style: AppFonts.monmbold,
                                          ),
                                        ),
                                        Divider(
                                          thickness: 0.5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );

                          }
                      ),
                    ),



                  ],
                ),
              )),
        ],
      ),
    );
  }
}