
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:norwayfinalcustomer/Component/Color/color.dart';
import 'package:norwayfinalcustomer/Component/Style/style.dart';
import 'package:norwayfinalcustomer/car/pages/Taxi_Map.dart';
import 'package:norwayfinalcustomer/car/pages/carooption.dart';

import 'Signup.dart';




class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isSuccess;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  @override
  Widget build(BuildContext context) {

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10),
      color:Color(0xff2980B9),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
         if(_formKey.currentState.validate()){
           _signInWithEmailAndPassword();
         }
        },
        child: Text("Login",
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
          //  gradient: new LinearGradient(
          //     colors: [
          //
          //       AppColors.silver,
          //       Colors.black87,
          //     ],
          //   stops: [0.0, 1.0],
          //   begin: FractionalOffset.topCenter,
          //   end: FractionalOffset.bottomCenter,
          //   tileMode: TileMode.repeated
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
                    SizedBox(height: 20.0),
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
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        SizedBox(width: 5,),
                        Spacer(),
                        InkWell(
                            child: Text('Forget Password', style: AppFonts.monmwhit12,)
                        ),
                      ],
                    ),


                    SizedBox(
                      height: 15.0,
                    ),
                    loginButon,
                    SizedBox(
                      height: 15.0,
                    ),
                    Center(
                      child: Container(

                        height: 20,
                        width: 200,
                        child: Row(
                          children: [
                            Container(
                              child: Text('Not have an account?'),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (_) => Signup()));
                              },
                              child: Container(
                                child: Text(' Signup',style: TextStyle(fontSize: 15, fontWeight:FontWeight.w500,color: Colors.white ),),
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
          ),
        ),
      ),
    );

  }
  void _signInWithEmailAndPassword() async {

    // _auth.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text).whenComplete(() =>{
    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)
    //   {
    //     return HomeScreen();
    //   }))
    // }).then((value) =>
    //     Fluttertoast.showToast(
    //         msg:  "Invalid Email or password",
    //         toastLength: Toast.LENGTH_SHORT,
    //         gravity: ToastGravity.CENTER,
    //         timeInSecForIos: 3,
    //         backgroundColor: Colors.red,
    //         textColor: Colors.white,
    //         fontSize: 16.0)
    //
    // );
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      )).user;
      // if (!user.emailVerified) {
      //   await user.sendEmailVerification();
      // }
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return Taxi_Map();
      }));
    } catch (e) {
      Fluttertoast.showToast(
          msg:  e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      print("Failed to sign in with Email & Password");
      // Scaffold.of(context).showSnackBar(SnackBar(
      //   content: Text("Failed to sign in with Email & Password"),
      // ));
    }
  }

}
