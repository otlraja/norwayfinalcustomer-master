import 'package:flutter/material.dart';

import 'foodEarning.dart';
import 'FoodEarningCard.dart';

class FoodEarning_List extends StatefulWidget {
  @override
  _FoodEarning_ListPageState createState() => _FoodEarning_ListPageState();
}

class _FoodEarning_ListPageState extends State<FoodEarning_List> {
  List<foodEarnings> searchResults;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchResults = foodEarningsList;
  }

  @override
  Widget build(BuildContext context) {
    if (foodEarningsList == null) foodEarningsList = [];
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.43,
      child: ListView.builder(
          shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: foodEarningsList.length,
          itemBuilder: (_, index) {
            return foodEarningCard(
              foodearnings: foodEarningsList[index],
            );
          }),
    );
  }
}
