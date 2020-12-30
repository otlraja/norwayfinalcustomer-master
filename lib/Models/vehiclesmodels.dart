import 'package:firebase_database/firebase_database.dart';


class VehicleModel {
  int budget;
  String title;
  var image;



  VehicleModel(this.budget,this.image,this.title);

  VehicleModel.fromSnapshot(DataSnapshot snapshot);
}