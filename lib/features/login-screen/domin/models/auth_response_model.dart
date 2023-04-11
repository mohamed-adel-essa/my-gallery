import 'package:gallery/features/login-screen/domin/models/user_model.dart';

class AuthResponseModel {
  UserModel? user;
  String? token;
  String? erroMsg;
  AuthResponseModel({this.user, this.token, this.erroMsg});

  AuthResponseModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    token = json['token'];
    erroMsg = json['error_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }

  factory AuthResponseModel.withErroMsg(String erroMsg) {
    return AuthResponseModel(erroMsg: erroMsg);
  }
}
