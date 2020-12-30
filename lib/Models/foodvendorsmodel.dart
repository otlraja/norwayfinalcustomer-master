class FoodVendors{
  var image;
  var name;
  var id;
  var address;
  var totalReviews;
  var avgRating;
  var lat;
  var lng;

  FoodVendors({this.image, this.name, this.id,this.address, this.totalReviews, this.avgRating, this.lat, this.lng});


// factory FoodVendors.fromJson(Map<String, dynamic> jsonData) {
//   return FoodVendors(
//     id: jsonData['id'],
//     name: jsonData['name'],
//     image: jsonData['image'],
//   );
// }

// static Map<String, dynamic> toMap(FoodVendors vendors) => {
//   'id': vendors.id,
//   'image': vendors.image,
//   'name': vendors.name,
// };

// static String encodeMusics(List<FoodVendors> cart) => json.encode(
//   cart
//       .map<Map<dynamic, dynamic>>((music) => FoodVendors.toMap(music))
//       .toList(),
// );
}