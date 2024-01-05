// To parse this JSON data, do
//
//     final personModel = personModelFromJson(jsonString);

import 'dart:convert';

PersonModel personModelFromJson(String str) =>
    PersonModel.fromJson(json.decode(str));

String personModelToJson(PersonModel data) => json.encode(data.toJson());

class PersonModel {
  final String? mode;
  final List<Formdatum>? formdata;

  PersonModel({
    this.mode,
    this.formdata,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
        mode: json["mode"],
        formdata: json["formdata"] == null
            ? []
            : List<Formdatum>.from(
                json["formdata"]!.map((x) => Formdatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mode": mode,
        "formdata": formdata == null
            ? []
            : List<dynamic>.from(formdata!.map((x) => x.toJson())),
      };
}

class Formdatum {
  final String? key;
  final String? value;
  final String? type;
  final String? src;

  Formdatum({
    this.key,
    this.value,
    this.type,
    this.src,
  });

  factory Formdatum.fromJson(Map<String, dynamic> json) => Formdatum(
        key: json["key"],
        value: json["value"],
        type: json["type"],
        src: json["src"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
        "type": type,
        "src": src,
      };
}
