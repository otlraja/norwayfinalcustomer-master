import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/global.dart';
import 'package:norwayfinalcustomer/main.dart';
import 'package:norwayfinalcustomer/testSplash.dart';
import 'CreditCard.dart';
import 'foodModule/Widget/Component/Style/style.dart';
import 'global.dart';

class PaymentCardDetails extends StatefulWidget {
  final getSelectedpayment;
  PaymentCardDetails({Key key, this.getSelectedpayment}) : super(key: key);
  @override
  _PaymentCardDetailsState createState() => _PaymentCardDetailsState();
}

class _PaymentCardDetailsState extends State<PaymentCardDetails> {
  int _groupValue1 = -1;
  int _groupValue2 = -1;
  var visible = false;

  void setisselected(var index, var newvalue) {
    setState(() {
      for (int i = 0; i < credit.length; i++) {
        if (i == index) {
          credit[i].isselected = newvalue;
        } else {
          credit[i].isselected = -1;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          elevation: 1,
          leading: InkWell(
            child: Icon(
              Icons.cancel,
              color: Colors.green[200],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text('Select a Payment Method'),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 25.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                child: Container(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Radio(
                                  value: 1,
                                  activeColor: Colors.green,
                                  groupValue: _groupValue1,
                                  onChanged: (newValue) => setState(() {
                                    selectpaymenttype = "cash";
                                    setState(() {
                                      widget.getSelectedpayment("cash");
                                    });
                                    _groupValue1 = newValue;
                                    visible = false;

                                    _groupValue2 = -1;
                                    Future.delayed(
                                        const Duration(milliseconds: 500), () {
                                      Navigator.pop(context);
                                      // Navigator.pop(context);
                                      // Navigator.of(context)
                                      //     .push(MaterialPageRoute(builder: (_) => FoodCheckout()));
                                    });
                                  }),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Cash',
                                        style: AppFonts.monm,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                child: Icon(
                                  Icons.money,
                                  color: Colors.green[500],
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Radio(
                                  value: 1,
                                  activeColor: Colors.green,
                                  groupValue: _groupValue2,
                                  onChanged: (newValue) => setState(() {
                                    selectpaymenttype = "card";
                                    //widget.getSelectedpayment("card");
                                    // setState(() {
                                    //   widget.getSelectedpayment("payment");
                                    // });
                                    _groupValue2 = newValue;
                                    visible = true;
                                    _groupValue1 = -1;
                                    Future.delayed(
                                        const Duration(milliseconds: 500),
                                            () {});
                                  }),
                                ),
                              ),
                              InkWell(
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Credit or Debit Card',
                                          style: AppFonts.monm,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                // onTap: () {
                                //   setState(() {
                                //     widget.getSelectedpayment("payment");
                                //   });
                                //
                                //   // Navigator.of(context)
                                //   //     .push(MaterialPageRoute(builder: (_) => MasterCard()));
                                // },
                              ),
                              Spacer(),
                              Container(
                                child: Icon(
                                  Icons.credit_card,
                                  color: Colors.green[500],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Visibility(
                visible: visible,
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Stack(
                    children: [
                      Container(
                        height: 300,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: credit.length,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      child: Radio(
                                        toggleable: true,
                                        value: 1,
                                        groupValue: credit[index].isselected,
                                        activeColor: Colors.green,
                                        onChanged: (newValue) => setState(() {
                                          //setState(() {
                                          if (selectedcardindex !=
                                              index.toString()) {
                                            setisselected(index, newValue);
                                            selectedcardindex =
                                                index.toString();
                                            SplashTest.sharedPreferences.setString(
                                                "selectedcardindex",
                                                selectedcardindex.toString());
                                            widget.getSelectedpayment(
                                                selectedcardindex.toString());
                                            //});
                                            credit[index].isselected = newValue;
                                            Future.delayed(
                                                const Duration(
                                                    milliseconds: 500), () {
                                              Navigator.pop(context);
                                            });
                                          } else {
                                            widget.getSelectedpayment(
                                                selectedcardindex);

                                            Future.delayed(
                                                const Duration(
                                                    milliseconds: 200), () {
                                              Navigator.pop(context);
                                            });
                                          }
                                        }),
                                      ),
                                    ),
                                    Container(
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              credit[index].cardNumber,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                            Text(
                                              "Card Holder | " +
                                                  credit[index].cardHolderName,
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      child: Icon(
                                        Icons.credit_card,
                                        color: Colors.green[500],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MasterCard()));
                            },
                            child: Container(
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Text(
                                    "Add Card",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  )),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // bottomNavigationBar:
        // Container(
        //   padding: EdgeInsets.only(bottom: 10),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Text(
        //         "SELECT ANY CARD",
        //         style: TextStyle(
        //
        //             color: Color(0xff454545),
        //             fontFamily: "Open Sans Bold",
        //             fontSize: 12.0,fontWeight: FontWeight.bold),
        //       ),
        //       // SizedBox(height: 10,)
        //
        //     ],
        //   ),
        // ),
      ),
    );
  }
}