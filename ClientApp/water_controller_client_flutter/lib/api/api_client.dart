import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:water_controller_client_flutter/models/add_client_response.dart';
import 'package:water_controller_client_flutter/models/default_response.dart';
import 'package:water_controller_client_flutter/models/list_data_client.dart';
import 'package:water_controller_client_flutter/models/list_data_module.dart';

class ApiService {
  static const String _baseUrl = 'http://192.168.100.152/water-controller/api';
  static const String _getListDataClient = '/client/';
  static const String _getListDataModule = '/module/';

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

  Future<DefaultResponse> deleteDataClient(http.Client client, id) async {
    final response = await client.delete(
      Uri.parse("$_baseUrl$_getListDataClient$id"),
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
    );
    if (response.statusCode == 200) {
      return DefaultResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal untuk menghapus data');
    }
  }

  Future<AddClientResponse> addDataClient(
      http.Client client, name, moduleId, results) async {
    final response = await client.post(
      Uri.parse("$_baseUrl$_getListDataClient"),
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: {"name": name, "module_id": moduleId, "result": results},
    );
    if (response.statusCode == 200) {
      return AddClientResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal untuk menambahkan data');
    }
  }
}
