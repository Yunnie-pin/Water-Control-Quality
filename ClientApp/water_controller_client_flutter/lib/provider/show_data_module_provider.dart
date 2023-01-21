import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:water_controller_client_flutter/models/list_data_module.dart';
import '../api/api_client.dart';
import '../utility/result_state.dart';

class ShowDataModuleProvider extends ChangeNotifier {
  final ApiService apiService;

  ShowDataModuleProvider({required this.apiService}) {
    getData();
  }

  late ListDataModule _listDataModule;
  late ResultState _state;
  String _message = '';

  ListDataModule get list => _listDataModule;
  ResultState get state => _state;
  String get message => _message;

  getData() async {
    await _fetchDataModule();
    Timer.periodic(const Duration(seconds: 5), (t) {
      _fetchDataModule();
    });
  }

  conditionalFunction(String nilai) {
    double number = double.parse(nilai);
    if (number > 0 && number < 300) {
      return "Tanah Kering";
    } else if (number > 301 && number < 600) {
      return "Tanah Lembab";
    } else if (number > 601) {
      return "Tanah Basah";
    } else {
      return "Hasil tidak diketahui";
    }
  }

  Future _fetchDataModule() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final listData = await apiService.listDataModule(http.Client());
      if (listData.data.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Tidak ada data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _listDataModule = listData;
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
