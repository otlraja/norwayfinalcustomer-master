import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Italian.dart';
import 'Italian_card.dart';

class Italian_List extends StatefulWidget {
  @override
  _Italian_ListPageState createState() => _Italian_ListPageState();
}

class _Italian_ListPageState extends State<Italian_List> {
  List<Italian> searchResults;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchResults = italianList;
  }

  @override
  Widget build(BuildContext context) {
    if (italianList == null) italianList = [];
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: italianList.length,
          itemBuilder: (_, index) {
            return italianCard(
              italian: italianList[index],
            );
          }),
    );
  }
}
