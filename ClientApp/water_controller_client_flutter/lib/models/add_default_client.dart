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
    required this.cobasd,
    required this.hasil,
  });

  final int cobasd;
  final String hasil;

  factory AddDefaultClient.fromJson(Map<String, dynamic> json) =>
      AddDefaultClient(
        cobasd: json["cobasd"],
        hasil: json["hasil"],
      );

  Map<String, dynamic> toJson() => {
        "cobasd": cobasd,
        "hasil": hasil,
      };
}
