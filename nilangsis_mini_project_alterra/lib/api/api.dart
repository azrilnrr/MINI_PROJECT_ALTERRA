import 'dart:convert';
import 'dart:io';
import 'package:nilangsis_mini_project_alterra/model/data_pelanggaran.dart';
import 'package:http/http.dart' as http;
import 'package:nilangsis_mini_project_alterra/model/data_siswa.dart';

class DataApi {
  static const baseUrl = 'http://192.168.1.5:8080/mp_nilangsis';
  static const dataPelanggaran = '/tampil-data-pelanggaran.php';
  static const tambahDataPelanggaran = '/insert-pelanggaran-siswa.php';
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

  static Future<bool> insertData(
      String namaSiswa,
      String kelas,
      String namaPelanggaran,
      String tanggalKejadian,
      File buktiPelanggaran) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('$baseUrl$tambahDataPelanggaran'));
    request.fields['namaSiswa'] = namaSiswa;
    request.fields['kelas'] = kelas;
    request.fields['namaPelanggaran'] = namaPelanggaran;
    request.fields['tanggalKejadian'] = tanggalKejadian;
    request.files.add(await http.MultipartFile.fromPath(
        'buktiPelanggaran', buktiPelanggaran.path));
    var response = await request.send();
    var responseBody = await response.stream.bytesToString();
    print(responseBody);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  // data siswa api
  static Future<List<DataSiswa>> getDataSiswa() async {
    final response = await http.get(Uri.parse('$baseUrl$dataSiswa'));

    if (response.statusCode == 200) {
      Map body = jsonDecode(response.body);
      List dataSiswa = body['data'];
      return dataSiswa.map((e) => DataSiswa.fromJson(e)).toList();
    } else {
      throw 'Gagal mengambil data';
    }
  }
}
