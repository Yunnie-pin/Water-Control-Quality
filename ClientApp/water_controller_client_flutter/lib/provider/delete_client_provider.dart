import 'package:flutter/cupertino.dart';
import 'package:water_controller_client_flutter/models/default_response.dart';
import 'package:http/http.dart' as http;
import '../api/api_client.dart';
import '../utility/result_state.dart';

class DeleteClientProvider extends ChangeNotifier {
  final ApiService apiService;

  DeleteClientProvider({required this.apiService});

  late DefaultResponse _responseClient;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  DefaultResponse get result => _responseClient;

  ResultState get state => _state;

  Future<dynamic> submitDeleteClient(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final clientResponse =
          await apiService.deleteDataClient(http.Client(), id);
      if (!(clientResponse.data)) {
        _state = ResultState.error;
        notifyListeners();
        return _message = 'Failed to delete data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _responseClient = clientResponse;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
