// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    required this.title,
    required this.rows,
  });

  String title;
  List<RowList> rows;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    title: json["title"],
    rows: List<RowList>.from(json["rows"].map((x) => RowList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "rows": List<dynamic>.from(rows.map((x) => x.toJson())),
  };
}

class RowList {
  RowList({
    this.title,
    this.description,
    this.imageHref,
  });

  String? title;
  String? description;
  String? imageHref;

  factory RowList.fromJson(Map<String, dynamic> json) => RowList(
    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? null : json["description"],
    imageHref: json["imageHref"] == null ? null : json["imageHref"],
  );

  Map<String, dynamic> toJson() => {
    "title": title == null ? null : title,
    "description": description == null ? null : description,
    "imageHref": imageHref == null ? null : imageHref,
  };
}
