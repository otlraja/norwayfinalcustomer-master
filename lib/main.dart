import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:norwayfinalcustomer/testSplash.dart';
import 'Saloon/pages/book.dart';
import 'Saloon/pages/home.dart';
import 'Saloon/uidata.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var success = false;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    ///Set color status bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,//or set color with: Color(0xFF0000FF)
        statusBarIconBrightness: Brightness.dark),
    );

    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Poppins',
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            primaryColorLight: Colors.white,
            primaryColorBrightness: Brightness.light,
            primaryColor: Colors.white),

        home: SplashTest(),

        routes: <String, WidgetBuilder>{
          UIData.homePageRoute: (BuildContext context) => HomePage(),
          UIData.bookPageRoute: (BuildContext context) => BookPage(),
        }
    );
  }
}
