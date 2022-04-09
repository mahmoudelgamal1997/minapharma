import 'package:minafarma/service/utils/state_manager/base_notifier.dart';

class UserModel extends BaseNotifier{
  String? email;
  String? password;

  UserModel({this.email,this.password});

  factory UserModel.fromJson(Map<String, dynamic> parsedJson) {
    return new UserModel(
        email: parsedJson['email'] ?? "",
        password: parsedJson['password'] ?? "");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}