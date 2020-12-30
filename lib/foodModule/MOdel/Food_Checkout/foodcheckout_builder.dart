import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/Models/products.dart';
import 'package:norwayfinalcustomer/global.dart';

import 'foodcheckout_card.dart';
import 'foodheckout_list.dart';

class FoodCheckoutList extends StatefulWidget {
  @override
  _FoodCheckoutListEditPageState createState() =>
      _FoodCheckoutListEditPageState();
}

class _FoodCheckoutListEditPageState extends State<FoodCheckoutList> {
  List<FoodCheckOutt> searchResults;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    getcheckoutlist();
    super.initState();
    searchResults = foodcheckoutt;
  }

  var id = new List();
  var showset;

  void getcheckoutlist(){

    Comparator<Products> priceComparator = (b, a) => a.quantityoncheckout.compareTo(b.quantityoncheckout);

    if(type == 'food'){
      showset = globalfoodcart;
    }
    else if(type == 'grocery'){
      showset = globalgrocerycart;
    }
    else if(type == 'store'){
      showset = globalstorecart;
    }


    showset = showset..sort(priceComparator);
    newglobalfoodcart.clear();
    for(int i = 0; i< showset.length; i++){
      if(!id.contains(showset[i].id)){
        id.add(showset[i].id);
        newglobalfoodcart.add(showset[i]);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    if (foodcheckoutt == null) foodcheckoutt = [];
    return
      Container(
        height: MediaQuery.of(context).size.height / 3.35,
        width: MediaQuery.of(context).size.width,
        child: FoodCheckOutCard(
          foodcheckoutt: newglobalfoodcart,
        ),
      );
  }
}