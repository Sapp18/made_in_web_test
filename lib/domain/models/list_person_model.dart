// To parse this JSON data, do
//
//     final listPersonModel = listPersonModelFromJson(jsonString);

import 'dart:convert';

List<ListPersonModel> listPersonModelFromJson(String str) =>
    List<ListPersonModel>.from(
        json.decode(str).map((x) => ListPersonModel.fromJson(x)));

String listPersonModelToJson(List<ListPersonModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListPersonModel {
  final String? name;
  final String? lastName;
  final String? mLastName;
  final DateTime? birthday;
  final String? email;
  final String? rfc;
  final String? curp;
  final String? password;
  final String? image;

  ListPersonModel({
    this.name,
    this.lastName,
    this.mLastName,
    this.birthday,
    this.email,
    this.rfc,
    this.curp,
    this.password,
    this.image,
  });

  factory ListPersonModel.fromJson(Map<String, dynamic> json) =>
      ListPersonModel(
        name: json["name"],
        lastName: json["last_name"],
        mLastName: json["m_last_name"],
        birthday:
            json["birthday"] == null ? null : DateTime.parse(json["birthday"]),
        email: json["email"],
        rfc: json["rfc"],
        curp: json["curp"],
        password: json["password"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "last_name": lastName,
        "m_last_name": mLastName,
        "birthday":
            "${birthday!.year.toString().padLeft(4, '0')}-${birthday!.month.toString().padLeft(2, '0')}-${birthday!.day.toString().padLeft(2, '0')}",
        "email": email,
        "rfc": rfc,
        "curp": curp,
        "password": password,
        "image": image,
      };
}
