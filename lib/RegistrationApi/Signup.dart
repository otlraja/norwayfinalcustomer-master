import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:norwayfinalcustomer/API/API.dart';
import 'package:norwayfinalcustomer/Component/Color/color.dart';
import 'package:norwayfinalcustomer/Component/Style/style.dart';
import 'package:norwayfinalcustomer/global.dart';

import 'package:progress_dialog/progress_dialog.dart';

import 'login.dart';

class Signupapi extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signupapi> {
  var success = "false";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _displayName = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController  _phoneController = TextEditingController();


  ProgressDialog pr;
  var clickstatus=true;


  @override
  void initState() {
    pr = ProgressDialog(context);
    super.initState();
  }

  TextEditingController controllerown;
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void waittosignup() async {
    await Future.delayed(const Duration(seconds: 1), () {
      if(API.success == 'true'){

        pr.hide();
      clickstatus=true;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Loginapi()));
      }
      else if(API.success == 'error'){
        pr.hide();
        clickstatus=true;
        // Get.snackbar(
        //   "DELETE",
        //   "The email has already been taken.",
        //   icon: Icon(Icons.delete),
        //   shouldIconPulse: true,
        //   barBlur: 20,
        //   dismissDirection: SnackDismissDirection.HORIZONTAL,
        //   isDismissible: true,
        //   duration: Duration(seconds: 4),
        // );
      }
      else {
        waittosignup();
      }

    });

  }

  Widget build(BuildContext context) {


    final signupButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10),
      color:Color(0xff2980B9),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          if(_formKey.currentState.validate()){
            if(clickstatus)
              {
                clickstatus=false;
                pr.show();
                API.signup(signupAPI, _displayName.text, _emailController.text, _passwordController.text, _phoneController.text);
                waittosignup();
                print("ab");
              }

          }
        },
        child: Text("Signup",
          textAlign: TextAlign.center,
          style: AppFonts.monm20white,
        ),
      ),
    );
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height:MediaQuery.of(context).size.height,
            decoration: new BoxDecoration(
                gradient: new LinearGradient(
                    colors: [
                      Colors.black87,
                      AppColors.silver,

                    ],
                    stops: [0.0, 1.0],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    tileMode: TileMode.repeated
                )
            ),


            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height:200,
                      width: 200,
                      child: Image.asset('assets/logo-AK-Booker (1).png',width: 200,height: 200,),
                    ),
                    SizedBox(height: 20.0),
                    Container(


                      width: 350,
                      height: 50,

                      child:TextFormField(
                        controller: _displayName,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.person, color: AppColors.lightgrey,),
                          filled: true,
                          border: new OutlineInputBorder(

                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              )
                          ),
                          fillColor: Colors.white70,
                          hintText: 'Name',
                          hintStyle: AppFonts.monm12bold,
                        ),

                      ),

                    ),
                    SizedBox(height: 10.0),
                    Container(


                      width: 350,
                      height: 50,

                      child:TextFormField(
                        controller: _emailController,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.email, color: AppColors.lightgrey,),
                          filled: true,
                          border: new OutlineInputBorder(

                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              )
                          ),
                          fillColor: Colors.white70,
                          hintText: 'Email',
                          hintStyle: AppFonts.monm12bold,
                        ),

                      ),

                    ),
                    SizedBox(height: 10.0),
                    Container(


                      width: 350,
                      height: 50,

                      child:TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _phoneController,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.call_sharp, color: AppColors.lightgrey,),
                          filled: true,
                          border: new OutlineInputBorder(

                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              )
                          ),
                          fillColor: Colors.white70,
                          hintText: 'Phone',
                          hintStyle: AppFonts.monm12bold,
                        ),

                      ),

                    ),
                    SizedBox(height: 10,),
                    Container(


                      width: 350,
                      height: 50,

                      child:TextFormField(
                        controller: _passwordController,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.remove_red_eye, color: AppColors.lightgrey,),
                          filled: true,
                          border: new OutlineInputBorder(

                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              )
                          ),
                          fillColor: Colors.white70,
                          hintText: 'Password',
                          hintStyle: AppFonts.monm12bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    signupButon,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}