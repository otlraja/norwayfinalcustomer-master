import 'package:firebase_database/firebase_database.dart';


class OnGoingOrdersModel {
  String CustomerId,CustomerName,RequestId,ToAddress,FromAddress,distance,duration,ServiceType;
  var FromLatitude,FromLongitude,ToLatitude,ToLongitude,isAccepted,isJourneyCancelled,
      isJourneyEnded,isJourneyStarted,isPickedUp,RidDate,RideTime,ServiceBudget,Serviceimage,price;


  OnGoingOrdersModel(this.CustomerId,this.CustomerName,this.RequestId,this.ToAddress,this.FromAddress,this.distance,
      this.FromLatitude,this.FromLongitude,this.ToLatitude,this.ToLongitude,this.isAccepted,this.isJourneyCancelled,
      this.isJourneyEnded,this.isJourneyStarted,this.isPickedUp,this.duration,this.RidDate,this.ServiceBudget,
      this.RideTime,this.ServiceType,this.Serviceimage,this.price);

  OnGoingOrdersModel.fromSnapshot(DataSnapshot snapshot);
}