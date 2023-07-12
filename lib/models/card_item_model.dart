class CardItemModel {
  String avatar;
  String accountName;

  String number;
  int amount;
  String type;
  String status;
  String time;
  bool? starred ;

  CardItemModel({
    required this.number,
    required this.type,
    required this.avatar,
    required this.accountName,
    required this.amount,
    required this.status,
    required this.time,
    this.starred,
  });
}
