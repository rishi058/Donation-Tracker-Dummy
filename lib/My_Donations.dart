
class Donation{
  int creator_id ;
  String currency ;
  int amount;
  String name;
  String message;

  Donation({
    required this.creator_id,
    required this.currency,
    required this.amount,
    required this.name,
    required this. message,
  });

}

List<Donation> My_Donations = [];