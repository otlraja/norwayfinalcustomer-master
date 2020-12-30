
import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/foodReservation/components/bookNow.dart';
class BookFragment extends StatefulWidget {
  const BookFragment({Key key, @required this.price}) : super(key: key);
//
  final double price;
//
  @override
  _BookFragmentState createState() => _BookFragmentState();
}

class _BookFragmentState extends State<BookFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 88,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 31,
              bottom: 31,
              left: 40,
              child: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: '\$',
                        style: TextStyle(color:Colors.black,fontSize: 20)),
                    TextSpan(
                        text: widget.price.toStringAsFixed(2),
                        style: TextStyle(color:Colors.black,fontSize: 20))
                  ])),
            ),
            Positioned(
              top: 18,
              bottom: 18,
              right: 24,
              child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => BooknowReservation()));
                  },
                  child: Container(
                    width: 135,
                    height: 52,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.blue.withOpacity(0.2),
                              blurRadius: 24,
                              offset: Offset(0, 8))
                        ]),
                    child: Center(
                        child: Text("Book",
                            style: TextStyle(color:Colors.white,fontSize: 20))
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}