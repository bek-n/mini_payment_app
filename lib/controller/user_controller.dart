import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mini_payment_app/domain/card_model.dart';
import 'package:mini_payment_app/domain/model/arxiv_model.dart';
import '../domain/model/user_model.dart';

class UserController extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  UserModel? user;
  String? doc;
  bool loading = false;
  bool cardLoading = false;
  bool createCardLoading = false;
  bool editLoading = false;
  bool deleteLoading = false;
  bool sendLoading = false;
  List<CardModel> lst = [];

  getUser() async {
    loading = true;
    notifyListeners();
    var res =
        await firestore.collection("user").doc('gFEkMa5epajz0du4fbbL').get();
    user = UserModel.fromJson(res.data());
    loading = false;
    notifyListeners();
  }

  createCard({
    required String number,
    required String cardHolder,
    required String cvv,
    required String expiredDate,
    required VoidCallback onSuccess,
  }) async {
    cardLoading = true;
    notifyListeners();

    await firestore.collection("cards").add(CardModel(
            cardHolder: cardHolder,
            cvv: cvv,
            expiredDate: expiredDate,
            number: number,
            cardId: '')
        .toJson());

    cardLoading = false;
    notifyListeners();
    onSuccess();
  }

  getCards() async {
    createCardLoading = true;
    notifyListeners();
    var res;

    res = await firestore.collection("cards").get();
    lst.clear();
    for (var element in res.docs) {
      String docId = element.id;
      lst.add(CardModel.fromJson(element.data(), docId));
      print(lst.length);
    }
    createCardLoading = false;
    notifyListeners();
  }

  editCard({
    required VoidCallback onSuccess,
    required CardModel infos,
  }) async {
    editLoading = true;
    notifyListeners();

    await firestore.collection("cards").doc(infos.cardId).update(CardModel(
            cardHolder: infos.cardHolder,
            cvv: infos.cvv,
            expiredDate: infos.expiredDate,
            number: infos.number,
            cardId: '')
        .toJson());
    editLoading = false;
    notifyListeners();
    onSuccess();
  }

  deleteCard({required String docId, required VoidCallback onSuccess}) async {
    deleteLoading = true;
    notifyListeners();
    CollectionReference cards = firestore.collection('cards');
    await cards.doc(docId).delete();
    deleteLoading = false;
    notifyListeners();
    onSuccess();
  }

  sendMoney({
    required UserModel infos,
    required num money,
    required VoidCallback onSuccess,
  }) {
    sendLoading = true;
    notifyListeners();

    infos.totalBalance = infos.totalBalance - money;
    firestore
        .collection('user')
        .doc('gFEkMa5epajz0du4fbbL')
        .update(UserModel(totalBalance: infos.totalBalance).toJson());
    debugPrint(' Jami : ${infos.totalBalance}');
    sendLoading = false;
    notifyListeners();
    onSuccess();
  }

  createArxiv({
    required String date,
    required String name,
    required String comment,
    required String summa,
    required VoidCallback onSuccess,
  }) async {
    cardLoading = true;
    notifyListeners();

    await firestore.collection("arxiv").add(
        ArxivModel(name: name, date: date, summa: summa, comment: comment)
            .toJson());

    cardLoading = false;
    notifyListeners();
    onSuccess();
  }
}
