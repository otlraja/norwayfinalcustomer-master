import 'package:firebase_database/firebase_database.dart';


class PastOrdersModel {
  String CustomerId,acceptedByID,acceptedByName,RequestId,ToAddress,FromAddress,distance,duration,ServiceType;
  var FromLatitude,FromLongitude,ToLatitude,ToLongitude,isAccepted,isJourneyCancelled,
      isJourneyEnded,isJourneyStarted,isPickedUp,RidDate,RideTime,ServiceBudget,Serviceimage,price,isJourneyCancelledbyCustomer,isJourneyCancelledbyDriver;

  PastOrdersModel(this.CustomerId,this.acceptedByID,this.acceptedByName,this.RequestId,this.ToAddress,this.FromAddress,this.distance,
      this.FromLatitude,this.FromLongitude,this.ToLatitude,this.ToLongitude,this.isAccepted,this.isJourneyCancelled,
      this.isJourneyEnded,this.isJourneyStarted,this.isPickedUp,this.duration,this.RidDate,this.ServiceBudget,
      this.RideTime,this.ServiceType,this.Serviceimage,this.price,this.isJourneyCancelledbyCustomer,this.isJourneyCancelledbyDriver);

  PastOrdersModel.fromSnapshot(DataSnapshot snapshot);
}