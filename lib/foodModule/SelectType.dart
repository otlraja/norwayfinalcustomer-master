
import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/API/API.dart';
import 'package:norwayfinalcustomer/foodModule/Screen/foodcategory.dart';
import 'package:norwayfinalcustomer/foodReservation/components/MainHome.dart';
import 'package:norwayfinalcustomer/global.dart';
class SelectType extends StatefulWidget {
  @override
  _SelectTypeState createState() => _SelectTypeState();
}

class _SelectTypeState extends State<SelectType> {

  var indicatorvisible = false;
  var i = 0;
  var clickstatus=true;


  waittofetchvendors() async {
    if (i == 0) {
      setState(() {
        indicatorvisible = true;
        //indicator();
      });
    }
    await Future.delayed(const Duration(seconds: 1), () {
      if (API.success == 'true') {
        setState(() {
          indicatorvisible = false;
        });
        i = 0;
        clickstatus=true;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryFood()));
      } else {
        waittofetchvendors();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Align(
               alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(left: 25),
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.height/2.1,
                child: InkWell(
                  child: Card(
                    child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 130,
                                width: 150,

                                child: Image.asset("assets/Image 4@3x.png",fit: BoxFit.fill,),

                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text("Restaurants Reservation",style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold,fontSize: 14),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text("Burgers, pizza, briyani and more",style: TextStyle(fontSize: 12),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text("Order Food",style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold,fontSize: 14),),
                              ),

                            ],


                          ),
                  ),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainHome()));
                  },
                ),
              ),

            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.only(right: 25),
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.height/2.1,
                child: InkWell(
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 130,
                          width: 150,

                          child: Image.asset("assets/Image 4@3x.png",fit: BoxFit.fill,),

                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text("Resturant",style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold,fontSize: 14),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text("Burgers, pizza, briyani and more",style: TextStyle(fontSize: 12),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text("Order Food",style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold,fontSize: 14),),
                        ),

                      ],
                    ),
                  ),
                  onTap: (){

                    if(clickstatus)
                      {
                        clickstatus=false;
                        API.allfoodvendors(FoodvendorAPI);
                        waittofetchvendors();
                      }

                  },
                ),
              ),

            ),
            indicatorshow(indicatorvisible),
          ],
        ),
      ),
    );
  }
}
