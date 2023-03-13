class CardModel {
  final String cardHolder, cvv, expiredDate, number;

  CardModel(
      {required this.cardHolder,
      required this.cvv,
      required this.expiredDate,
      required this.number});

  factory CardModel.fromJson(Map<String, dynamic> data) {
    return CardModel(
        cardHolder: data['card_holder'],
        cvv: data['cvv'],
        expiredDate: data['expired_date'],
        number: data['number']);
  }

  toJson() {
    return {
      'card_holder': cardHolder,
      'cvv': cvv,
      'expired_date': expiredDate,
      'number': number
    };
  }
}
