import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/Component/Color/color.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/Component/Style/style.dart';



class FoodSupport extends StatefulWidget {
  @override
  _FoodSupportState createState() => _FoodSupportState();
}

class _FoodSupportState extends State<FoodSupport> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 1.16,
              child: Container(
                height: MediaQuery.of(context).size.height / 1.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            child: Text('Support', style: AppFonts.monmbold20),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 1.29,
                      child: SingleChildScrollView(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 230,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.only(top: 20),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/SplashLogo.png',
                                    width: 120,
                                    height: 120,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('AK BOOKER', style: AppFonts.monmbold20),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Store', style: AppFonts.monmbold20),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height / 1.9,
                                color: Colors.white,
                                padding: EdgeInsets.all(17.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Or Write to us your queries',
                                        style: AppFonts.monmblackbold18),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text('will get back to you soon',
                                        style: AppFonts.monm15),
                                    Container(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Icon(
                                              Icons.email,
                                              color: AppColors.yellowColor,
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(left: 10),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.2,
                                            child: TextField(
                                              maxLines: 5,
                                              decoration: const InputDecoration(
                                                  hintText: 'Message',
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey),
                                                  ),
                                                  errorBorder: InputBorder.none,
                                                  disabledBorder:
                                                      InputBorder.none,
                                                  //labelText: 'YOUR MESSAGE',
                                                  labelStyle: TextStyle(
                                                      color:
                                                          Color(0xfffbbc00))),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 12,
              color: AppColors.yellowColor,
              child: Center(
                child: Text(
                  'Update info',
                  style: AppFonts.monmwhit16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
