// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:equatable/equatable.dart';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel extends Equatable {
  String? authId;
  String? name;
  String? organizationName;
  String? emailId;
  String? password;
  int? time;
  String? photo;
  String? admin;

  AuthModel({
    this.authId,
    this.name,
    this.organizationName,
    this.emailId,
    this.password,
    this.time,
    this.photo,
    this.admin,
  });

  AuthModel copyWith({
    String? authId,
    String? name,
    String? organizationName,
    String? emailId,
    String? password,
    int? time,
    String? photo,
    String? admin,
  }) =>
      AuthModel(
        authId: authId ?? this.authId,
        name: name ?? this.name,
        organizationName: organizationName ?? this.organizationName,
        emailId: emailId ?? this.emailId,
        password: password ?? this.password,
        time: time ?? this.time,
        photo: photo ?? this.photo,
        admin: admin ?? this.admin,
      );

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        authId: json["authId"],
        name: json["name"],
        organizationName: json["organizationName"],
        emailId: json["emailId"],
        password: json["password"],
        time: json["time"],
        photo: json["photo"],
        admin: json["admin"],
      );

  Map<String, dynamic> toJson() => {
        "authId": authId,
        "name": name,
        "organizationName": organizationName,
        "emailId": emailId,
        "password": password,
        "time": time,
        "photo": photo,
        "admin": admin,
      };

  @override
  List<Object?> get props =>
      [authId, name, organizationName, emailId, password, time, photo, admin];
}
