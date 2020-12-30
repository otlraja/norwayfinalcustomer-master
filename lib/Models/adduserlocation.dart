

import 'dart:convert';

class userlocation {
  var title;
  var address;
  var latitude;
  var longitude;
  var id;
  var unique;
  var selected;

  userlocation({this.title, this.address, this.latitude, this.longitude,this.id,this.unique,this.selected});


  factory userlocation.fromJson(Map<String, dynamic> jsonData) {
    return userlocation(
      title: jsonData['title'],
      address: jsonData['address'],
      latitude: jsonData['latitude'],
      longitude: jsonData['longitude'],
      id: jsonData['id'],
        unique: jsonData['unique'],
        selected: jsonData['selected'],
    );
  }

  static Map<String, dynamic> toMap(userlocation userlocations) =>
      {
        'title': userlocations.title,
        'address': userlocations.address,
        'latitude': userlocations.latitude,
        'longitude': userlocations.longitude,
        'id': userlocations.id,
        'unique': userlocations.unique,
        'selected': userlocations.selected,

      };

  static String encodeMusics(List<userlocation> cart) =>
      json.encode(
        cart
            .map<Map<dynamic, dynamic>>((music) => userlocation.toMap(music))
            .toList(),
      );

  static List<userlocation> decodeMusics(String cart) {
    if (cart != null) {
      return (json.decode(cart) as List<dynamic>)
          .map<userlocation>((item) => userlocation.fromJson(item))
          .toList();
    }
    else {
      return new List();
    }
  }

}


