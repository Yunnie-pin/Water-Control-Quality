// To parse this JSON data, do
//
//     final listDataClient = listDataClientFromJson(jsonString);

import 'dart:convert';

ListDataClient listDataClientFromJson(String str) =>
    ListDataClient.fromJson(json.decode(str));

String listDataClientToJson(ListDataClient data) => json.encode(data.toJson());

class ListDataClient {
  ListDataClient({
    required this.code,
    required this.status,
    required this.data,
  });

  final int code;
  final String status;
  final List<Datum> data;

  factory ListDataClient.fromJson(Map<String, dynamic> json) => ListDataClient(
        code: json["code"],
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.nama,
    required this.sensorPh,
    required this.sensorSuhu,
  });

  final int id;
  final String nama;
  final double sensorPh;
  final int sensorSuhu;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        nama: json["nama"],
        sensorPh: json["sensorPh"]?.toDouble(),
        sensorSuhu: json["sensorSuhu"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "sensorPh": sensorPh,
        "sensorSuhu": sensorSuhu,
      };
}
