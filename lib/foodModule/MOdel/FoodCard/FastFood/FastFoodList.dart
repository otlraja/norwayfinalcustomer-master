
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FastFood.dart';
import 'FastFood_card.dart';


class FastFood_List extends StatefulWidget {
  @override
  _FastFood_ListPageState createState() => _FastFood_ListPageState();

}
class _FastFood_ListPageState extends State<FastFood_List> {

  List<FastFood> searchResults;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchResults = fastFoodList;

  }
  @override
  Widget build(BuildContext context) {
    if(fastFoodList==null)
      fastFoodList = [];
    return  Container(

      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: fastFoodList.length,
          itemBuilder: (_, index) {
            return fastFoodCard(
              fastFood: fastFoodList[index],
            );
          }
      ),
    );
  }
}