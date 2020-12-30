import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/foodReservation/components/restaurant_select.dart';
import 'package:norwayfinalcustomer/foodReservation/components/time_select.dart';
import 'package:geolocator/geolocator.dart';


import 'bottom_card.dart';
class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isTimeCardOpen = false;
  String _selectedRestaurant = 'Burger King';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 60),

            Expanded(
              child: Stack(
                children: <Widget>[
                  RestaurantSelect(
                    selectedRestaurant: _selectedRestaurant,
                    onSelect: _handleRestaurantSelect,
                  ),
                  BottomCard(
                    isOpen: _isTimeCardOpen,
                    onToggle: _toggleTimeCard,
                    child: TimeSelect(
                      onCardToggle: _toggleTimeCard,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _toggleTimeCard() => setState(() => _isTimeCardOpen = !_isTimeCardOpen);

  _handleRestaurantSelect(String name) {
    setState(() {
      _isTimeCardOpen = true;
      _selectedRestaurant = name;
    });
  }
}