class UserModel {
  final num? totalBalance;

  UserModel({this.totalBalance});

  factory UserModel.fromJson(Map<String, dynamic>? data) {
    return UserModel(totalBalance: data?['balance']);
  }

  toJson() {
    return {'balance': totalBalance};
  }
}
