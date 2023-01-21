// To parse this JSON data, do
//
//     final addClientResponse = addClientResponseFromJson(jsonString);

import 'dart:convert';

AddClientResponse addClientResponseFromJson(String str) =>
    AddClientResponse.fromJson(json.decode(str));

String addClientResponseToJson(AddClientResponse data) =>
    json.encode(data.toJson());

class AddClientResponse {
  AddClientResponse({
    required this.data,
  });

  final Data data;

  factory AddClientResponse.fromJson(Map<String, dynamic> json) =>
      AddClientResponse(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.name,
    required this.moduleId,
    required this.result,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.module,
  });

  final String name;
  final int moduleId;
  final String result;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;
  final Module module;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        moduleId: json["module_id"],
        result: json["result"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        module: Module.fromJson(json["module"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "module_id": moduleId,
        "result": result,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
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
