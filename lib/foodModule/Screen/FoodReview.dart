import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/Component/Color/color.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/Component/Style/style.dart';


import '../../global.dart';
import '../model/FoodReviews/FoodReview_builder.dart';

class FoodReview extends StatefulWidget {
  final index;
  FoodReview(this.index);
  @override
  _FoodReviewState createState() => _FoodReviewState();
}

class _FoodReviewState extends State<FoodReview> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    height: 96,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              child: IconButton(
                                iconSize: 20,
                                icon: Icon(Icons.arrow_back_ios),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            Container(
                              child: Text(
                                'Reviews',
                                style: AppFonts.monmbold20,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 30,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.star,
                                        color: AppColors.yellowColor,
                                        size: 15,
                                      ),
                                      onPressed: (){},
                                    ),
                                  ),
                                  Container(
                                    width: 30,
                                    child: Text(
                                      double.parse(globalvendors[widget.index].avgRating).toStringAsFixed(1)+' ',
                                      style: AppFonts.monmyellow,
                                    ),
                                  ),
                                  Text(
                                    globalvendors[widget.index].totalReviews.toString()+' Reviews',
                                    style: AppFonts.monmgrey,
                                  )
                                ],
                              )),
                        ),
                      ],
                    )),
                Container(
                  color: Colors.black12,
                  height: 5,
                ),
                Container(
                    padding: EdgeInsets.only(top: 10),
                    height: MediaQuery.of(context).size.height / 1.3,
                    child: FoodReviewList()),
              ],
            ),
          )),
    );
  }
}