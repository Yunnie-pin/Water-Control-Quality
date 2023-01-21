import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:water_controller_client_flutter/models/list_data_client.dart';
import '../api/api_client.dart';
import '../utility/result_state.dart';

class ListDataClientProvider extends ChangeNotifier {
  final ApiService apiService;

  ListDataClientProvider({required this.apiService}) {
    _fetchAlllistDataList();
  }

  late ListDataClient _listDataClient;
  late ResultState _state;
  String _message = '';

  ListDataClient get list => _listDataClient;
  ResultState get state => _state;
  String get message => _message;

  Future _fetchAlllistDataList() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final listData = await apiService.listDataClient(http.Client());
      if (listData.data.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Tidak ada data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _listDataClient = listData;
      }
    } on SocketException {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'No Internet Connection';
    } on HttpException {
      _state = ResultState.error;
      notifyListeners();
      return _message = "Couldn't find the post";
    } on FormatException {
      _state = ResultState.error;
      notifyListeners();
      return _message = "Bad response format";
    }
  }

  Future refreshAllDataClient() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final listData = await apiService.listDataClient(http.Client());
      if (listData.data.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Tidak ada data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _listDataClient = listData;
      }
    } on SocketException {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'No Internet Connection';
    } on HttpException {
      _state = ResultState.error;
      notifyListeners();
      return _message = "Couldn't find the post";
    } on FormatException {
      _state = ResultState.error;
      notifyListeners();
      return _message = "Bad response format";
    }
  }
}
