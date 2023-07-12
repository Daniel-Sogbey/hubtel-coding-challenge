class CardItemModel {
  String avatar;
  String accountType;

  String number;
  int amount;
  String type;
  String status;
  String time;

  CardItemModel({
    required this.number,
    required this.type,
    required this.avatar,
    required this.accountType,
    required this.amount,
    required this.status,
    required this.time,
  });
}
