import 'package:flutter/material.dart';

import 'foodmsg.dart';
import 'foodmsgCard.dart';

class FoodMsg_List extends StatefulWidget {
  @override
  _FoodMsg_ListPageState createState() => _FoodMsg_ListPageState();
}

class _FoodMsg_ListPageState extends State<FoodMsg_List> {
  List<foodsMsgs> searchResults;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchResults = foodMsgsList;
  }

  @override
  Widget build(BuildContext context) {
    if (foodMsgsList == null) foodMsgsList = [];
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1.15,
        child: ListView.builder(
            shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: foodMsgsList.length,
            itemBuilder: (_, index) {
              return foodMsgCard(
                foodmsgs: foodMsgsList[index],
              );
            }),
      ),
    );
  }
}
