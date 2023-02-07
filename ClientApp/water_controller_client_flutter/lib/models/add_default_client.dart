// To parse this JSON data, do
//
//     final addDefaultClient = addDefaultClientFromJson(jsonString);

import 'dart:convert';

AddDefaultClient addDefaultClientFromJson(String str) => AddDefaultClient.fromJson(json.decode(str));

String addDefaultClientToJson(AddDefaultClient data) => json.encode(data.toJson());

class AddDefaultClient {
    AddDefaultClient({
        required this.sensor1,
        required this.hasil,
    });

    final int sensor1;
    final String hasil;

    factory AddDefaultClient.fromJson(Map<String, dynamic> json) => AddDefaultClient(
        sensor1: json["sensor1"],
        hasil: json["hasil"],
    );

    Map<String, dynamic> toJson() => {
        "sensor1": sensor1,
        "hasil": hasil,
    };
}
