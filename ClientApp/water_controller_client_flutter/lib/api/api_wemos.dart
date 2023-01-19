import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:water_controller_client_flutter/models/detail_wemos.dart';

class ApiService {
  static const String _baseUrl = 'http://192.168.1.2:3300/api/client';
  static const String _getListDataClient = '/client';

  Future<ListDataClient> listRestaurant(http.Client client) async {
    final response =
        await client.get(Uri.parse("$_baseUrl$_getListDataClient"));
    if (response.statusCode == 200) {
      return ListDataClient.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal untuk memuat list Restaurant');
    }
  }
}
