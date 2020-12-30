
import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/theme/ripple.dart';


class LoadingBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bodyProgress = SpinKitRipple(color: Colors.green[500],size: 100.0,);
    return bodyProgress;
  }
}