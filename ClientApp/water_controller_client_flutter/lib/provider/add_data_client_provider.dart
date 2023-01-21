import 'package:flutter/cupertino.dart';
import 'package:water_controller_client_flutter/models/add_client_response.dart';
import 'package:http/http.dart' as http;
import '../api/api_client.dart';
import '../utility/result_state.dart';

class AddDataClientProvider extends ChangeNotifier {
  final ApiService apiService;

  AddDataClientProvider({required this.apiService});

  late AddClientResponse _responseClient;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  AddClientResponse get result => _responseClient;

  ResultState get state => _state;

  Future<dynamic> addDataClient(String id, name, moduleId, results) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final clientResponse = await apiService.addDataClient(
          http.Client(), name, moduleId, results);
      _state = ResultState.hasData;
      notifyListeners();
      return _responseClient = clientResponse;
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
