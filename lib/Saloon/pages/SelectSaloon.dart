import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/Saloon/Model/SaloonCategory.dart';
import 'package:norwayfinalcustomer/Saloon/pages/home.dart';
import 'package:norwayfinalcustomer/Saloon/uidata.dart';
import 'package:norwayfinalcustomer/Saloon/widgets/SearchSaloon.dart';
import 'package:norwayfinalcustomer/foodModule/MOdel/CategoryList.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/SearchBarfood.dart';

class SaloonSelect extends StatefulWidget {
  @override
  _SaloonSelectState createState() => _SaloonSelectState();
}

class _SaloonSelectState extends State<SaloonSelect> {
  var _value='Home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UIData.mainColor,
        title:new DropdownButton<String>(
          dropdownColor: UIData.mainColor,
          value: _value,
          items: <DropdownMenuItem<String>>[
            new DropdownMenuItem(
              child: new Text('Home',style: TextStyle(fontWeight: FontWeight.bold,color: UIData.lighterColor)),
              value: 'Home',
            ),
            new DropdownMenuItem(
                child: new Text('Office',style: TextStyle(fontWeight: FontWeight.bold,color: UIData.lighterColor),),
                value: 'Office'
            ),
            new DropdownMenuItem(
                child: new Text('Set Location',style: TextStyle(fontWeight: FontWeight.bold,color: UIData.lighterColor)),
                value: 'Set Location'
            ),
            new DropdownMenuItem(

                child: new Text('Other',style: TextStyle(fontWeight: FontWeight.bold,color: UIData.lighterColor)),
                value: 'Other'
            ),
          ],
          onChanged: (String value) {
            setState(() => _value = value);
          },)
        ,
        leading: GestureDetector(
          child: Icon(
            Icons.location_on,
            color:UIData.lighterColor,
          ),
        ),
        actions: <Widget>[
          // Padding(
          //     padding: EdgeInsets.only(right: 20.0),
          //     child: GestureDetector(
          //       onTap: () {},
          //       // child: Icon(
          //       //   Icons.shopping_cart,
          //       //   size: 26.0,
          //       // ),
          //     )
          // ),
        ],
      ),
      body:  SafeArea
        (
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: UIData.lighterColor,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:30.0,right: 20,left: 20),
                child: SearchSaloon(),
              ),
              Padding(
                padding: const EdgeInsets.only(top:90.0,right: 30,left: 30),
                child: Text(
                  "Got Appointment Now ",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: UIData.mainColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:130.0,left: 20,right: 20),
                child: GridView.count(

                  crossAxisCount: 2,
                  children: List.generate(categoryfood.length, (index) {
                    return Container(
                      color: UIData.lightColor,
                      child: Card(
                        child: InkWell(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "${categorySaloon[index]['img']}",
                                height: 80,

                              ),
                              SizedBox(height: 10,),
                              Text(
                                  "${categorySaloon[index]['name']}",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold
                                  )
                              ),

                            ],
                          ),
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                        ),
                        elevation: 1,
                        color: Colors.grey[200],
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
