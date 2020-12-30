import 'package:credit_card/credit_card_form.dart';
import 'package:credit_card/credit_card_model.dart';
import 'package:credit_card/credit_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/global.dart';
import 'package:norwayfinalcustomer/testSplash.dart';

import 'Models/credit_card_model.dart';
import 'main.dart';


class MasterCard extends StatefulWidget {
  @override
  _MasterCardState createState() => _MasterCardState();
}

class _MasterCardState extends State<MasterCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;



  // get creditcard => null;

  void onModelChange(CreditCardModel model){
    setState(() {
      cardNumber = model.cardNumber;
      expiryDate = model.expiryDate;
      cardHolderName = model.cardHolderName;
      cvvCode = model.cvvCode;
      isCvvFocused = model.isCvvFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Card')),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              height: 200.0,
              width: MediaQuery.of(context).size.width/1.2,
              animationDuration: Duration(milliseconds: 1500),
            ),

            Expanded(child: SingleChildScrollView(
              child: CreditCardForm(onCreditCardModelChange: onModelChange),
            ),),
            new OutlineButton(
              child: Text(
                credircardbuttontex,
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              onPressed: () {

                credit.add(
                  CreditCardModel(
                    cardHolderName: cardHolderName,
                    cardNumber: cardNumber,
                    cvvCode: cvvCode,
                    expiryDate: expiryDate,
                    isCvvFocused: isCvvFocused,
                    isselected: -1,
                  ),
                );

                final String
                encodedData =
                CreditCardModel.encodeMusics(credit);
                SplashTest.sharedPreferences.setString("creditcard",
                    encodedData);

                Navigator.pop(context);

              },
              shape: new RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}