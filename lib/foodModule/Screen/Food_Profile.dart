import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/firstpage.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/Component/Style/style.dart';

import '../../global.dart';
import '../../testSplash.dart';
import 'FoodEarningView.dart';
import 'FoodReview.dart';
import 'Food_StoreProfile.dart';
import 'Food_Support.dart';

import 'Food_TermsCondition.dart';

class FoodProfile extends StatefulWidget {
  @override
  _FoodProfileState createState() => _FoodProfileState();
}

class _FoodProfileState extends State<FoodProfile> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                'My Profile',
                style: AppFonts.monmbold1,

              ),
              elevation: 0,
            ),
            backgroundColor: Colors.grey[100],
            body: Column(children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      width: size.width,
                      height: size.height / 6.8,
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: size.height,
                            width: size.width / 3,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: userimage != null
                                      ? Image.network(
                                          userimage,
                                          fit: BoxFit.fill,
                                        )
                                      : Image.asset(
                                          "assets/profile1.png",
                                          fit: BoxFit.fill,
                                        )),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(username != null ? username : 'Omar', style: AppFonts.monmbold),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.grey[400],
                                    size: 15,
                                  ),
                                  Text(' Norway ', style: AppFonts.monr),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              FoodStoreProfile()));
                                },
                                child: Text('MY Profile',
                                    style: AppFonts.monmyellowbold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Container(
                          padding: EdgeInsets.only(left: 15),
                          color: Colors.white,
                          width: size.width,
                          height: size.height / 1.7,
                          child: Column(
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => FoodTermsConditions()));
                                },
                                child: Container(
                                  width: size.width,
                                  height: size.height / 10,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        width: 40,
                                        height: 40,
                                        child:
                                            Image.asset('assets/termslogo.JPG'),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12.0),
                                        child: Text('Terms & Conditions',
                                            style: AppFonts.monm),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => FoodSupport()));
                                },
                                child: Container(
                                  width: size.width,
                                  height: size.height / 10,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        width: 40,
                                        height: 40,
                                        child: Image.asset(
                                            'assets/supportlogo.JPG'),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12.0),
                                        child: Text('Support',
                                            style: AppFonts.monm),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  usertoken=null;
                                  username =  null;
                                  useremail =  null;
                                  userid =  null;
                                  userphone =  null;
                                  userimage =  null;
                                  SplashTest.sharedPreferences.setString("usertoken", null);
                                  SplashTest.sharedPreferences.setString("username", null);
                                  SplashTest.sharedPreferences.setString("useremail", null);
                                  SplashTest.sharedPreferences.setString("userid",  null);
                                  SplashTest.sharedPreferences.setString("userphone",  null);
                                  SplashTest.sharedPreferences.setString("userimage",  null);

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Firstpage()));
                                },
                                child: Container(
                                  width: size.width,
                                  height: size.height / 10,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        width: 40,
                                        height: 40,
                                        child: Image.asset(
                                            'assets/logoutlogo.JPG'),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12.0),
                                        child: Text('Logout',
                                            style: AppFonts.monm),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ])));
  }
}
