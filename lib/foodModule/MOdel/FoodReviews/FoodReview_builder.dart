import 'package:flutter/material.dart';

import '../../../global.dart';
import 'FoodReview_Card.dart';

// import 'checkoutlist.dart';
//
// import 'checkout_card.dart';

class FoodReviewList extends StatefulWidget {
  @override
  _FoodReviewListEditPageState createState() => _FoodReviewListEditPageState();
}

class _FoodReviewListEditPageState extends State<FoodReviewList> {
  // List<FoodReview> searchResults;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //searchResults = foodreview;
  }

  @override
  Widget build(BuildContext context) {
    //if (Foodreview == null) Foodreview = [];
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: Foodreview.length,
            itemBuilder: (_, index) {
              return FoodReviewCard(
                //foodreview: Foodreview[index],
                ind: index,
              );
            }),
      ),
    );
  }
}