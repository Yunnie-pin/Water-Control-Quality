// To parse this JSON data, do
//
//     final listDataModule = listDataModuleFromJson(jsonString);

import 'dart:convert';

ListDataModule listDataModuleFromJson(String str) =>
    ListDataModule.fromJson(json.decode(str));

String listDataModuleToJson(ListDataModule data) => json.encode(data.toJson());

class ListDataModule {
  ListDataModule({
    required this.data,
  });

  final List<Datum> data;

  factory ListDataModule.fromJson(Map<String, dynamic> json) => ListDataModule(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.value,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String name;
  final String value;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        value: json["value"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "value": value,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
