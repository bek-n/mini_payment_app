import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mini_payment_app/domain/card_model.dart';

import '../domain/model/user_model.dart';

class UserController extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  UserModel? user;
  bool loading = false;
  bool cardLoading = false;
  bool createCardLoading = false;
  bool editLoading = false;
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
            number: number)
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
      lst.add(CardModel.fromJson(element.data()));
      print(lst.length);
    }
    createCardLoading = false;
    notifyListeners();
  }

  editCard({
    required VoidCallback onSuccess,
    required CardModel infos,
    required String docId,
  }) async {
    editLoading = true;
    notifyListeners();

     await firestore.collection("cards").doc(docId).update(CardModel(
            cardHolder: infos.cardHolder,
            cvv: infos.cvv,
            expiredDate: infos.expiredDate,
            number: infos.expiredDate)
        .toJson());
    editLoading = false;
    notifyListeners();
    onSuccess();
  }
}
