import 'dart:convert';

import 'package:nilangsis_mini_project_alterra/model/data_pelanggaran.dart';
import 'package:http/http.dart' as http;
import 'package:nilangsis_mini_project_alterra/model/data_siswa.dart';

class DataApi {
  static const baseUrl = 'http://192.168.1.5:8080/mp_nilangsis';
  static const dataPelanggaran = '/tampil-data-pelanggaran.php';
  static const imgAssets = 'http://192.168.1.5:8080/mp_nilangsis/assets/';
  static const dataSiswa = '/tampil-siswa.php';

  static Future<List<DataPelanggaran>> getDataPelanggaran() async {
    final response = await http.get(Uri.parse('$baseUrl$dataPelanggaran'));
    if (response.statusCode == 200) {
      Map body = jsonDecode(response.body);
      List dataPelanggarans = body['data'];
      // final List<DataPelanggaran> dataPelanggarans =
      //     body.map((e) => DataPelanggaran.fromJson(e)).toList();
      return dataPelanggarans.map((e) => DataPelanggaran.fromJson(e)).toList();
    } else {
      throw 'Gagal mengambil data';
    }
  }

  static Future<DataPelanggaran> getDataPelanggaranById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl$dataPelanggaran/$id'));
    if (response.statusCode == 200) {
      final dynamic body = jsonDecode(response.body);
      print('Body: $body');
      final DataPelanggaran product = DataPelanggaran.fromJson(body);
      return product;
    } else {
      throw "Can't get the data";
    }
  }

  // data siswa api
  static Future<List<DataSiswa>> getDataSiswa() async {
    final response = await http.get(Uri.parse('$baseUrl$dataSiswa'));

    if (response.statusCode == 200) {
      Map body = jsonDecode(response.body);
      List dataSiswa = body['data'];
      // final List<DataPelanggaran> dataSiswa =
      //     body.map((e) => DataPelanggaran.fromJson(e)).toList();
      return dataSiswa.map((e) => DataSiswa.fromJson(e)).toList();
    } else {
      throw 'Gagal mengambil data';
    }
  }
}
