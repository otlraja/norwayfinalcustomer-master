import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Chinese.dart';
import 'Chinese_card.dart';

class Chinese_List extends StatefulWidget {
  @override
  _Chinese_ListPageState createState() => _Chinese_ListPageState();
}

class _Chinese_ListPageState extends State<Chinese_List> {
  List<Chinese> searchResults;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchResults = chineseList;
  }

  @override
  Widget build(BuildContext context) {
    if (chineseList == null) chineseList = [];
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: chineseList.length,
          itemBuilder: (_, index) {
            return chineseCard(
              chinese: chineseList[index],
            );
          }),
    );
  }
}
