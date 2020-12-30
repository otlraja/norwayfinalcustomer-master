import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/Saloon/Model/ServicesList.dart';
import 'package:norwayfinalcustomer/Saloon/uidata.dart';
class SaloonServices extends StatefulWidget {
  @override
  _SaloonServicesState createState() => _SaloonServicesState();
}

class _SaloonServicesState extends State<SaloonServices> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          leading: InkWell(child: Icon(Icons.arrow_back),onTap: (){Navigator.pop(context);},)
          ,
          title: Text('Rose Pearl'),
        ),
        body: SafeArea(
          child: Container(
              child:Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child:
                SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height ,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: ServiceSaloonList.length,
                          itemBuilder: (_, index) {
                            return InkWell(
                              child: Card(
                                child: Container(
                                  height: MediaQuery.of(context).size.height/8.5,
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset('${ServiceSaloonList[index]['img']}'),
                                      ),

                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('${ServiceSaloonList[index]['title']}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                          ),
                                          Text('${ServiceSaloonList[index]['Address']}',style: TextStyle(fontSize: 12,),
                                          ),
                                          Text('${ServiceSaloonList[index]['km']}',style: TextStyle(fontSize: 12,),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Text('${ServiceSaloonList[index]['price']}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onTap:()=> Navigator.pushNamed(context, UIData.bookPageRoute),
                            );
                          }
                      ),
                    )
                ),

              )
          ),
        )
    );
  }
}
