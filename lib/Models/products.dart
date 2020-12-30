import 'dart:convert';

class Products implements Comparable<Products>{
  var image;
  var name;
  var price;
  var id;
  var quantity;
  var orderquantity;
  var quantityoncheckout;
  var vendorid;
  var vendorname;

  Products({this.image, this.name, this.price, this.id, this.quantity, this.orderquantity, this.quantityoncheckout,this.vendorid, this.vendorname});


  factory Products.fromJson(Map<String, dynamic> jsonData) {
    return Products(
      id: jsonData['id'],
      name: jsonData['name'],
      image: jsonData['image'],
      price: jsonData['price'],
      orderquantity: jsonData['orderquantity'],
      quantity: jsonData['quantity'],
      quantityoncheckout: jsonData['quantityoncheckout'],
      vendorid: jsonData['vendorid'],
      vendorname: jsonData['vendorname'],
    );
  }

  static Map<String, dynamic> toMap(Products vendors) => {
    'id': vendors.id,
    'image': vendors.image,
    'name': vendors.name,
    'price': vendors.price,
    'quantity': vendors.quantity,
    'orderquantity': vendors.orderquantity,
    'quantityoncheckout': vendors.quantityoncheckout,
    'vendorid': vendors.vendorid,
    'vendorname': vendors.vendorname,
  };

  static String encodeMusics(List<Products> cart) => json.encode(
    cart
        .map<Map<dynamic, dynamic>>((music) => Products.toMap(music))
        .toList(),
  );

  static List<Products> decodeMusics(String cart){
    if(cart != null){
      return (json.decode(cart) as List<dynamic>)
          .map<Products>((item) => Products.fromJson(item))
          .toList();
    }
    else{
      return new List();
    }
  }

  @override
  int compareTo(Products other) {
    // TODO: implement compareTo
    return quantityoncheckout - other.quantityoncheckout;

  }


}