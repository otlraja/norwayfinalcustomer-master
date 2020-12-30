import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/Component/Style/style.dart';


class FoodTermsConditions extends StatefulWidget {
  @override
  _FoodTermsConditionsState createState() => _FoodTermsConditionsState();
}

class _FoodTermsConditionsState extends State<FoodTermsConditions> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 60,
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
                      child: Text('Terms & Conditions',
                          style: AppFonts.monmbold20),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.2,
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
                            Text(
                              'AK BOOKER',
                              style: AppFonts.monmbold20,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Store', style: AppFonts.monm15bold),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Terms of use', style: AppFonts.monmbold20),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book. It usually begins with",
                                  style: AppFonts.monm15),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                  "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book. It usually begins with",
                                  style: AppFonts.monm15),
                              SizedBox(
                                height: 15,
                              ),
                              Text('Company Policy',
                                  style: AppFonts.monmbold20),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book. It usually begins with",
                                  style: AppFonts.monm15),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                  "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book. It usually begins with",
                                  style: AppFonts.monm15),
                            ],
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
      ),
    );
  }
}
