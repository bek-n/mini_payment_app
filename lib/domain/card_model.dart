class CardModel {
  final String cardHolder, cvv, expiredDate, number, cardId;
  final int index;

  CardModel(
      {required this.cardHolder,
      required this.index,
      required this.cardId,
      required this.cvv,
      required this.expiredDate,
      required this.number});

  factory CardModel.fromJson(
    Map<String, dynamic> data,
    String docId,
  ) {
    return CardModel(
        index: data['image_index'],
        cardId: docId,
        cardHolder: data['card_holder'],
        cvv: data['cvv'],
        expiredDate: data['expired_date'],
        number: data['number']);
  }

  toJson() {
    return {
      'image_index': index,
      'card_holder': cardHolder,
      'cvv': cvv,
      'expired_date': expiredDate,
      'number': number
    };
  }
}
