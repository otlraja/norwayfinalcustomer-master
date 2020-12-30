// import 'dart:convert';
//
// class CreditCardModel {
//   var cardNumber;
//   var expiryDate;
//   var cardHolderName;
//   var cvvCode;
//   var isCvvFocused;
//   var isselected;
//
//   CreditCardModel({this.cardNumber, this.expiryDate, this.cardHolderName, this.cvvCode, this.isCvvFocused,this.isselected});
//
//
//   factory CreditCardModel.fromJson(Map<String, dynamic> jsonData) {
//     return CreditCardModel(
//       cardHolderName: jsonData['cardHolderName'],
//       cardNumber: jsonData['cardNumber'],
//       cvvCode: jsonData['cvvCode'],
//       expiryDate: jsonData['expiryDate'],
//       isCvvFocused: jsonData['isCvvFocused'],
//       isselected: jsonData['isselected'],
//     );
//   }
//
//   static Map<String, dynamic> toMap(CreditCardModel vendors) => {
//
//     'cardHolderName': vendors.cardHolderName,
//     'cardNumber': vendors.cardNumber,
//     'cvvCode': vendors.cvvCode,
//     'expiryDate': vendors.expiryDate,
//     'isCvvFocused': vendors.isCvvFocused,
//     'isselected': vendors.isselected,
//   };
//
//   static String encodeMusics(List<CreditCardModel> cart) => json.encode(
//     cart
//         .map<Map<dynamic, dynamic>>((music) => CreditCardModel.toMap(music))
//         .toList(),
//   );
//
//   static List<CreditCardModel> decodeMusics(String cart){
//     if(cart != null){
//       return (json.decode(cart) as List<dynamic>)
//           .map<CreditCardModel>((item) => CreditCardModel.fromJson(item))
//           .toList();
//     }
//     else{
//       return new List();
//     }
//   }
//
// }