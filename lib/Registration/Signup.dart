import 'dart:collection';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:norwayfinalcustomer/Component/Color/color.dart';
import 'package:norwayfinalcustomer/Component/Style/style.dart';

import 'package:progress_dialog/progress_dialog.dart';

import 'login.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var success = "false";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _displayName = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController  _phoneController = TextEditingController();


  ProgressDialog pr;
  @override

  TextEditingController controllerown;
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final SignupButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10),
      color:Color(0xff2980B9),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          if(_formKey.currentState.validate()){
            _registerAccount();
            print("ab");
          }else{
            print('bc');
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
              color: Colors.black
              // gradient: new LinearGradient(
                //     colors: [
                //
                //       AppColors.silver,
                //       Colors.black87,
                //     ],
                //     stops: [0.0, 1.0],
                //     begin: FractionalOffset.topCenter,
                //     end: FractionalOffset.bottomCenter,
                //     tileMode: TileMode.repeated
                // )
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
                      child: Image.asset('assets/images/logo-AK-Booker.png',width: 200,height: 200,),
                    ),
                    SizedBox(height: 45.0),
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
                        controller: _phoneController,
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
                          hintText: 'Password',
                          hintStyle: AppFonts.monm12bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    SignupButon,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );;
  }

  // void registerapi(){
  //   success = "false";
  //   String RUrl= "http://127.0.0.1:8000/api/signup";
  //   String url =RUrl;
  //   Dio dio = new Dio();
  //   FormData formData = new FormData.fromMap({
  //     'name': _displayName.text,
  //     'phone':_phoneController.text,
  //     'email': _emailController.text,
  //     'password': _passwordController.text,
  //   });
  //   try {
  //     dio.post(url, data: formData).then((response){
  //       Map<String, dynamic> data = response.data;
  //       var status = data['success'];
  //       if(status != null){
  //         success = "true";
  //         print('done');
  //       }
  //       else{
  //         success = "error";
  //         print('error');
  //       }
  //     });
  //
  //   } catch (e) {
  //     success = "error";
  //     print('Error: $e');
  //   }
  // }

  void _registerAccount() async {
    try {
      final User user = (await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      )).user;

      if (user != null) {
        if (!user.emailVerified) {
          await user.sendEmailVerification();
        }
        await user.updateProfile(displayName: _displayName.text);
        final user1 = _auth.currentUser;
        _register();

      } else {

        print("failde");
      }
    }catch(e){
      Fluttertoast.showToast(
          msg:  e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      // print(e.toString());
    }
  }

  Future<Void>  _register() {

    final User user = _auth.currentUser;
    Map<String, Object> createDoc = new HashMap();

    createDoc['Name'] = _displayName.text;
    createDoc['Email'] = _emailController.text;
    createDoc['Password'] = _passwordController.text;
    createDoc['uid']=user.uid;
    createDoc['isBusy']=false;
    createDoc['OnlineStatus']=true;


    FirebaseDatabase.instance
        .reference()
        .child("Customer")
        .child(user.uid)
        .set(createDoc);

    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) =>  Login()));


  }

}
