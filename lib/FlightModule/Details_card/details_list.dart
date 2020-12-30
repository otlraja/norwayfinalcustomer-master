
import 'package:flutter/material.dart';

import 'details.dart';
import 'details_card.dart';





class bestList extends StatefulWidget {
  @override
  _bestListPageState createState() => _bestListPageState();

}
class _bestListPageState extends State<bestList> {

  List<Bestseller> searchResults;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchResults = bestseller;

  }
  @override
  Widget build(BuildContext context) {
    if(bestseller==null)
      bestseller = [];
    return  Container(
      height: MediaQuery.of(context).size.height/4.5,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: bestseller.length,
          itemBuilder: (_, index) {
            return BestCard(
              bestsellers: bestseller[index],
            );
          }
      ),
    );
  }
}