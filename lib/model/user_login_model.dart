// To parse this JSON data, do
//
//     final userLoginModel = userLoginModelFromJson(jsonString);

import 'dart:convert';

UserLoginModel userLoginModelFromJson(String str) => UserLoginModel.fromJson(json.decode(str));

String userLoginModelToJson(UserLoginModel data) => json.encode(data.toJson());

class UserLoginModel {
  UserLoginModel({
    this.id,
    this.username,
    this.token,
  });

  String? id;
  String? username;
  String? token;

  factory UserLoginModel.fromJson(Map<String, dynamic> json) => UserLoginModel(
    id: json["id"],
    username: json["username"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "token": token,
  };
}
