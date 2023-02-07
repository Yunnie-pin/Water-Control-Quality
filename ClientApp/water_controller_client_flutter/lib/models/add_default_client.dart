// To parse this JSON data, do
//
//     final addDefaultClient = addDefaultClientFromJson(jsonString);

import 'dart:convert';

AddDefaultClient addDefaultClientFromJson(String str) =>
    AddDefaultClient.fromJson(json.decode(str));

String addDefaultClientToJson(AddDefaultClient data) =>
    json.encode(data.toJson());

class AddDefaultClient {
  AddDefaultClient({
    required this.id,
    required this.sensor1,
    required this.hasil,
  });

  final int id;
  final String sensor1;
  final String hasil;

  factory AddDefaultClient.fromJson(Map<String, dynamic> json) =>
      AddDefaultClient(
        id: json["id"],
        sensor1: json["sensor1"],
        hasil: json["hasil"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sensor1": sensor1,
        "hasil": hasil,
      };
}
