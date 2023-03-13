class ArxivModel {
  final String name, date, summa, comment;

  ArxivModel( 
      {required this.name,
      required this.date, 
      required this.summa,
      required this.comment,
      });

  factory ArxivModel.fromJson(Map<String, dynamic> data, String docId,) {
    return ArxivModel(
     
        name: data['name'],
        date: data['date'],
        comment: data['comment'],
        summa: data['summa']);
  }

  toJson() {
    return {
      'name': name,
      'date': date,
      'comment': comment,
      'summa': summa
    };
  }
}
