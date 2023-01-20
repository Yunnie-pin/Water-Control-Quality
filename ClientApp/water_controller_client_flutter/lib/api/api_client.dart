import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:water_controller_client_flutter/models/list_data_client.dart';
import 'package:water_controller_client_flutter/models/list_data_module.dart';

class ApiService {
  static const String _baseUrl = 'http://192.168.1.8/water-controller/api';
  static const String _getListDataClient = '/client';
  static const String _getListDataModule = '/module';

  Future<ListDataClient> listDataClient(http.Client client) async {
    final response =
        await client.get(Uri.parse("$_baseUrl$_getListDataClient"));
    if (response.statusCode == 200) {
      return ListDataClient.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal untuk memuat list Client');
    }
  }

  Future<ListDataModule> listDataModule(http.Client client) async {
    final response =
        await client.get(Uri.parse("$_baseUrl$_getListDataModule"));
    if (response.statusCode == 200) {
      return ListDataModule.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal untuk memuat list Module');
    }
  }
}
