import 'package:flutter/material.dart';
import 'package:nilangsis_mini_project_alterra/api/api.dart';
import 'package:nilangsis_mini_project_alterra/model/data_siswa.dart';

enum RequestState { empty, loading, loaded, error }

class DataSiswaProvider extends ChangeNotifier {
  List<DataSiswa> _dataSiswa = [];
  List<DataSiswa> get datasiswa => _dataSiswa;

  RequestState _requestState = RequestState.empty;
  RequestState get requestState => _requestState;

  String _message = '';
  String get message => _message;

  Future<void> getAllDataSiswa() async {
    _requestState = RequestState.loading;
    notifyListeners();
    try {
      final result = await DataApi.getDataSiswa();
      _dataSiswa = result;
      _requestState = RequestState.loaded;
      notifyListeners();
    } catch (e) {
      _requestState = RequestState.error;
      _message = 'data tidak terambil $e';
      print(_message);
      notifyListeners();
    }
  }
}
