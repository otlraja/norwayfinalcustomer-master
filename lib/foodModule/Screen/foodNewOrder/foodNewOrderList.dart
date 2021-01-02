import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/API/API.dart';
//import 'package:quicktask/shop/order/orderDetails.dart';
import '../../../global.dart';
import 'RidersDetails.dart';
import 'foodNewOrderDetails.dart';
import 'foodNewOrderCard.dart';

class foodNewOrderList extends StatefulWidget {
  @override
  _foodNewOrderListPageState createState() => _foodNewOrderListPageState();
}

class _foodNewOrderListPageState extends State<foodNewOrderList> {
  TextEditingController searchController = TextEditingController();

  var bool = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (globalorderinprogressfood == null) globalorderinprogressfood = [];
    //if(globalorderinprogressfood.isEmpty){
      getorders();
    //}
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: InkWell(
        child: Container(
          height: MediaQuery.of(context).size.height / 4.5,
          // width: MediaQuery.of(context).size.width,
          child: globalorderinprogressfood.length != 0 ?
          ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: globalorderinprogressfood.length,
              itemBuilder: (_, index) {
                return InkWell(
                  child: FoodNewOrderCard(
                    foodNewOrder: globalorderinprogressfood[index],
                  ),
                  onTap: (){
                    //indexx = index;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Ridersdetail(index)),
                    );
                  },
                );
              }):
          Container(
            child: Center(
              child: Text("No Order to Show", style: TextStyle(fontSize: 18),),
            ),
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
      API.orderinprogessfood(
          foodinprogress + userid, type);
      waitforresponse();
    }

    if(usertoken != null && bool && type == 'grocery'){
      bool = false;
      API.orderinprogessfood(groceryinprogress + userid, type);
      waitforresponse();
    }

    if(usertoken != null && bool && type == 'store') {
      bool = false;
      API.orderinprogessfood(storeinprogress + userid, type);
      waitforresponse();
    }
  }
}
