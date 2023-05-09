import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nilangsis_mini_project_alterra/api/api.dart';
import 'package:nilangsis_mini_project_alterra/model/data_pelanggaran.dart';

enum RequestState { empty, loading, loaded, error }

class DataPelanggaranProvider extends ChangeNotifier {
  List<DataPelanggaran> _dataPelannggarans = [];
  List<DataPelanggaran> get dataPelanggarans => _dataPelannggarans;
  DataPelanggaran? _dataPelanggaran;
  DataPelanggaran? get dataPelanggaran => _dataPelanggaran;

  RequestState _requestState = RequestState.empty;
  RequestState get requestState => _requestState;

  bool _isSukses = false;
  bool get isSuksess => _isSukses;

  String _message = '';
  String get message => _message;

  Future<void> getAllDataPelanggaran() async {
    _requestState = RequestState.loading;
    notifyListeners();
    try {
      final result = await DataApi.getDataPelanggaran();
      _dataPelannggarans = result;
      _requestState = RequestState.loaded;
      notifyListeners();
    } catch (e) {
      _requestState = RequestState.error;
      _message = 'data tidak terambil $e';
      print(_message);
      notifyListeners();
    }
  }

  // Future<void> getSingleDataPelanggaran(String id) async {
  //   _requestState = RequestState.loading;
  //   notifyListeners();
  //   try {
  //     final result = await DataApi.getDataPelanggaranById(id);
  //     _dataPelanggaran = result;
  //     print('Result: $result');
  //     _requestState = RequestState.loaded;
  //     notifyListeners();
  //   } catch (e) {
  //     _requestState = RequestState.error;
  //     _message = 'data tidak terambil: $e';
  //     notifyListeners();
  //   }
  // }

  Future<void> tambahData(
      String namaSiswa,
      String kelas,
      String namaPelanggaran,
      String tanggalKejadian,
      File buktiPelanggaran) async {
    _requestState = RequestState.loading;
    notifyListeners();
    try {
      bool berhasil = await DataApi.insertData(
          namaSiswa, kelas, namaPelanggaran, tanggalKejadian, buktiPelanggaran);
      if (berhasil) {
        _requestState = RequestState.loaded;
        notifyListeners();
        _isSukses = berhasil;
      } else {
        _requestState = RequestState.error;
        notifyListeners();
        _isSukses = berhasil;
      }
    } catch (e) {
      _requestState = RequestState.error;
      _message = 'error $e';
      print('error $e');
      notifyListeners();
      _isSukses = false;
    }
  }
}
