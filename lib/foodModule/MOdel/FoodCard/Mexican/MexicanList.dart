import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Mexican.dart';
import 'Mexican_card.dart';

class Mexican_List extends StatefulWidget {
  @override
  _Mexican_ListPageState createState() => _Mexican_ListPageState();
}

class _Mexican_ListPageState extends State<Mexican_List> {
  List<Mexican> searchResults;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchResults = mexicanList;
  }

  @override
  Widget build(BuildContext context) {
    if (mexicanList == null) mexicanList = [];
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: mexicanList.length,
          itemBuilder: (_, index) {
            return MexicanCard(
              mexican: mexicanList[index],
            );
          }),
    );
  }
}
