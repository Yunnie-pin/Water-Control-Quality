// To parse this JSON data, do
//
//     final listDataClient = listDataClientFromJson(jsonString);

import 'dart:convert';

ListDataClient listDataClientFromJson(String str) =>
    ListDataClient.fromJson(json.decode(str));

String listDataClientToJson(ListDataClient data) => json.encode(data.toJson());

class ListDataClient {
  ListDataClient({
    required this.data,
  });

  final List<Datum> data;

  factory ListDataClient.fromJson(Map<String, dynamic> json) => ListDataClient(
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
    required this.moduleId,
    required this.result,
    required this.createdAt,
    required this.updatedAt,
    required this.module,
  });

  final int id;
  final String name;
  final int moduleId;
  final String result;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Module module;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        moduleId: json["module_id"],
        result: json["result"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        module: Module.fromJson(json["module"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "module_id": moduleId,
        "result": result,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "module": module.toJson(),
      };
}

class Module {
  Module({
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

  factory Module.fromJson(Map<String, dynamic> json) => Module(
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
