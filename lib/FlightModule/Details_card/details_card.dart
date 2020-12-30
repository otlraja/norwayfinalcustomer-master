
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:norwayfinalcustomer/FlightModule/models/places.dart';

import 'dart:math';
import 'dart:ui';

import '../bookflight.dart';
import 'details.dart';





class BestCard extends StatefulWidget {
  final Bestseller bestsellers;
  final int ind;
  final Place place;

  const BestCard({Key key,this.ind, this.bestsellers,this.place}) : super(key: key);

  @override
  Bestcards createState() => Bestcards(this.bestsellers);

}
class Bestcards extends State<BestCard> {

  final Bestseller bestsellers;

  @override
  void initState() {
    // TODO: implement initState

    // img(image);


    super.initState();
    //img(image);

  }
  Bestcards(this.bestsellers);
  String img(image)
  {


    return image;

  }

  Function ontap(){
    Navigator.of(context).push(MaterialPageRoute(builder:(_)=> BookFlight()));
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var _counter;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [

        InkWell(
           onTap: ontap,
          child: Card(
            elevation: 5,
            child: Column(
              children: [
               Container(
                height: 25,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8,right: 10 , left:10),
                  child: Row(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        bestsellers.name, style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3,left: 3),
                        child: Text(
                          bestsellers.flightno,
                          style: TextStyle(fontSize: 11),
                        ),
                      ),
                      Spacer(),
                      Text('\$'),

                      Padding(
                        padding: const EdgeInsets.only(top: 2,right: 5),
                        child: Text(
                          bestsellers.price.toString(),
                          style: TextStyle(fontSize: 12),
                        ),
                      ),

                    ],

                  ),
                ),
               ),
                Divider(),

                Container(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,bottom: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:<Widget> [
                        Container(
                           child: Image.asset(bestsellers.image),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Column(
                            children: [
                              Text(bestsellers.takeofftime ,style: TextStyle(fontSize: 10, fontWeight:FontWeight.bold ),),
                              Text(bestsellers.too ,style: TextStyle(fontSize: 12, ),)
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 10,top: 10),
                          child: Column(
                            children: [
                              Text(bestsellers.landtime ,style: TextStyle(fontSize: 10, fontWeight:FontWeight.bold ),),
                              Text(bestsellers.froms ,style: TextStyle(fontSize: 12, ),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  )

                ),
             ],
            ),
          ),
        ),

        ],
      ),
    );
  }

}

