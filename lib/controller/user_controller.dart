import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/model/user_model.dart';

class UserController extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  UserModel? user;
  bool loading = false;

  getUser() async {
    loading = true;
    notifyListeners();
    var res =
        await firestore.collection("user").doc('gFEkMa5epajz0du4fbbL').get();
    user = UserModel.fromJson(res.data());
    loading = false;
    notifyListeners();
  }
}
