class foodEarnings {
  String name;
  String date;
  String time;
  String distance;
  String payment;
  String pick_address;
  String drop_address;
  String earningpayment;
  String amount;
  String items;

  foodEarnings(
      this.name,
      this.date,
      this.time,
      this.distance,
      this.payment,
      // this.pick_address,
      // this.drop_address,
      this.earningpayment,
      this.amount,
      this.items);
}

List<foodEarnings> foodEarningsList = [
  foodEarnings('Order num 212217', 'Jun 12, 2020', '11:00 am', 'COD', '\$50 ',
      '\$5.20', 'Earning', '2 items'),
  foodEarnings('Order num 212218', 'Jun 12, 2020', '11:00 am', 'COD', '\$50 ',
      '\$5.20', 'Earning', '3 items'),
  foodEarnings('Order num 212219', 'Jun 12, 2020', '11:00 am', 'COD', '\$50 ',
      '\$5.20', 'Earning', '2 items'),
  foodEarnings('Order num 212220', 'Jun 12, 2020', '11:00 am', 'COD', '\$50 ',
      '\$5.20', 'Earning', '4 items'),
  foodEarnings('Order num 212221', 'Jun 12, 2020', '11:00 am', 'COD', '\$50 ',
      '\$5.20', 'Earning', '5 items'),
  foodEarnings('Order num 212217', 'Jun 12, 2020', '11:00 am', 'COD', '\$50 ',
      '\$5.20', 'Earning', '2 items'),
  foodEarnings('Order num 212217', 'Jun 12, 2020', '11:00 am', 'COD', '\$50 ',
      '\$5.20', 'Earning', '3 items'),
  foodEarnings('Order num 212217', 'Jun 12, 2020', '11:00 am', 'COD', '\$50 ',
      '\$5.20', 'Earning', '2 items'),
];
