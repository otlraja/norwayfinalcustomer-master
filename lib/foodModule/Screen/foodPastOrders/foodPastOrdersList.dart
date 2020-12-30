import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/API/API.dart';

import '../../../global.dart';
import 'foodPastOrdersDetails.dart';
import 'foodPastOrdersCard.dart';

class foodPastOrdersList extends StatefulWidget {
  Function setindicator;

  @override
  _foodPastOrdersListPageState createState() => _foodPastOrdersListPageState();
}

class _foodPastOrdersListPageState extends State<foodPastOrdersList> {
  List<FoodPastOrders> searchResults;
  TextEditingController searchController = TextEditingController();
  var indicatorvisible = false;
  var i = 0;
  var bool = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //searchResults = foodPastOrders;
  }

  @override
  Widget build(BuildContext context) {
    if (globalcompleteorder == null) globalcompleteorder = [];
    if(globalcompleteorder.isEmpty){
      getorders();
    }
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 4.5,
        width: MediaQuery.of(context).size.width,
        child: globalcompleteorder.length != 0 ?
        ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: globalcompleteorder.length,
            itemBuilder: (_, index) {
              return FoodPastOrdersCard(
                foodPastOrders: globalcompleteorder[index],
              );
            }):
        Container(
          child: Center(
            child: Text("No Order to Show", style: TextStyle(fontSize: 18),),
          ),
        ),
      ),
    );
  }

   waitforresponse()async{
    await Future.delayed(const Duration(seconds: 1), () {
      if (API.success == 'true') {
       setState(() {

       });
      }
      else {
        waitforresponse();
      }
    });
  }



  void getorders(){
    if(usertoken != null && bool && type == 'food') {
      bool = false;
      API.comleteorder(foodcomplete+userid);
      waitforresponse();
    }

    if(usertoken != null && bool && type == 'grocery') {
      bool = false;
      API.comleteorder(grocerycomplete+userid);
      waitforresponse();
    }

    if(usertoken != null && bool && type == 'store') {
      bool = false;
      API.comleteorder(storecomplete+userid);
      waitforresponse();
    }
  }
}
