import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/Component/Color/color.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/Component/Style/style.dart';



import 'Chinese.dart';

class chineseCard extends StatefulWidget {
  final Chinese chinese;
  final int ind;

  const chineseCard({Key key, this.ind, this.chinese}) : super(key: key);
  @override
  chineseCards createState() => chineseCards(this.chinese);
}

class chineseCards extends State<chineseCard> {
  bool isSwitched = false;
  final Chinese chinese;
  int _itemCount=0;
  @override
  void initState() {
    // TODO: implement initState

    // img(image);

    super.initState();
    //img(image);
  }

  chineseCards(this.chinese);
  String img(image) {
    return image;
  }

  // Function ontap(){
  //   Navigator.of(context).push(MaterialPageRoute(builder:(_)=> EditProduct()));
  // }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: ontap,
      child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height / 4.0,
          width: MediaQuery.of(context).size.width / 1.2,
          padding: EdgeInsets.all(10),
          child: Container(
              height: 150,
              color: Colors.white,

              // padding: EdgeInsets.all(12.0,),
//                  height: MediaQuery.of(context).size.height,
//                  decoration: BoxDecoration(
//
//                    color: Colors.white,
//                  ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 0.0, top: 5),
                        child: Container(
                          height: 60,
                          width: 85,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              chinese.image,
                            ),
                          )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              chinese.name,
                              style: AppFonts.monmbold,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 4.0,
                              ),
                              child: Text(
                                chinese.price,
                                textAlign: TextAlign.left,
                                style: AppFonts.monmblack,
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Container(
                                    height: 25,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              '1 kg',
                                              style: AppFonts.monr,
                                            ),
                                            Icon(
                                              Icons.keyboard_arrow_down,
                                              color: Colors.green[500],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // Spacer(),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 75),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green[500]),
                            borderRadius: BorderRadius.circular(20),
                          ),

                          child: Row(
                            children: <Widget>[
                              _itemCount != 0
                                  ? new IconButton(
                                icon: new Icon(Icons.remove),
                                onPressed: () =>
                                    setState(() => _itemCount--),)
                                  : new Container(),
                              _itemCount != 0 ? new Text(
                                  _itemCount.toString()) : new Container(),
                              new IconButton(icon: new Icon(Icons.add),
                                  onPressed: () =>
                                      setState(() => _itemCount++))
                              ,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ))),
    );
  }
}
