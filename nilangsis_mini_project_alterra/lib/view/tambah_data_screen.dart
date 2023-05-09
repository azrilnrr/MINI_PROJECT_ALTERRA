import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nilangsis_mini_project_alterra/model/data_siswa.dart';
import 'package:nilangsis_mini_project_alterra/view/data_siswa_screen.dart';
import 'package:nilangsis_mini_project_alterra/view_model/data_pelanggaran_provider.dart';
import 'package:nilangsis_mini_project_alterra/widget/theme.dart';
import 'package:provider/provider.dart';

class TambahData extends StatefulWidget {
  TambahData({super.key, this.dataSiswa});
  final DataSiswa? dataSiswa;

  @override
  State<TambahData> createState() => _TambahDataState();
}

class _TambahDataState extends State<TambahData> {
  final TextEditingController _namaSiswaController = TextEditingController();
  final TextEditingController _kelasController = TextEditingController();
  final TextEditingController _namaPelanggaranController =
      TextEditingController();
  File? addFile;
  String? _imageBuktiPelanggaran;

  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();

  void tambahData() async {
    if (_imageBuktiPelanggaran != null) {
      String namaSiswa = _namaSiswaController.text;
      String kelas = _kelasController.text;
      String namaPelanggaran = _namaPelanggaranController.text;
      String tanggalKejadian = _dueDate.toIso8601String();
      File buktiPelanggaran = File(_imageBuktiPelanggaran!);

      Provider.of<DataPelanggaranProvider>(context, listen: false).tambahData(
          namaSiswa, kelas, namaPelanggaran, tanggalKejadian, buktiPelanggaran);
      bool isSukses =
          Provider.of<DataPelanggaranProvider>(context, listen: false)
              .isSuksess;
      Navigator.pop(context);
      if (isSukses) {
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('DATA BERHASIL DI TAMBAH'),
        ));
      }
    }
  }

  void getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      final file = result.files.first;
      setState(() {
        _imageBuktiPelanggaran = file.path;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please select file'),
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.dataSiswa != null) {
      _namaSiswaController.text = widget.dataSiswa!.namaSiswa;
      _kelasController.text = widget.dataSiswa!.kelas;
    }
  }

  @override
  void dispose() {
    _namaSiswaController.dispose();
    _kelasController.dispose();
    _namaPelanggaranController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: thirdColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Kembali',
          style: robotoBesarPutih.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'TAMBAH DATA PELANGGARAN',
                      style: robotoBesarHitam.copyWith(
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'NAMA',
                    style:
                        robotoBesarHitam.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      SizedBox(
                        width: 250,
                        height: 45,
                        child: TextFormField(
                          controller: _namaSiswaController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: whiteColor,
                            hintText: 'Masukkan Nama',
                            contentPadding: EdgeInsets.all(5),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: whiteColor)),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      TextButton(
                        child: Text(
                          'PILIH',
                          style: robotoSedangHitam.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DataSiswaScreen()));
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  Text(
                    'KELAS',
                    style:
                        robotoBesarHitam.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  SizedBox(
                    width: 250,
                    height: 45,
                    child: TextFormField(
                      controller: _kelasController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: whiteColor,
                        hintText: 'Masukkan Kelas',
                        contentPadding: EdgeInsets.all(5),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: whiteColor)),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'PELANGGARAN',
                    style:
                        robotoBesarHitam.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  SizedBox(
                    width: 250,
                    height: 45,
                    child: TextFormField(
                      controller: _namaPelanggaranController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: whiteColor,
                        hintText: 'Masukkan Nama Pelanggaran',
                        contentPadding: EdgeInsets.all(5),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: whiteColor)),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'TANGGAL',
                    style:
                        robotoBesarHitam.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      SizedBox(
                        width: 250,
                        height: 25,
                        child: Text(
                          DateFormat('dd-MM-yyyy').format(_dueDate),
                          style: robotoBesarHitam,
                        ),
                        // child: TextFormField(
                        //   controller: _tanggalController,
                        //   decoration: InputDecoration(
                        //     filled: true,
                        //     fillColor: whiteColor,
                        //     hintText: 'Masukkan Tanggal',
                        //     contentPadding: EdgeInsets.all(5),
                        //     enabledBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(10),
                        //         borderSide: BorderSide(color: whiteColor)),
                        //   ),
                        // ),
                      ),
                      SizedBox(width: 5),
                      TextButton(
                        child: Text(
                          'PILIH',
                          style: robotoSedangHitam.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          final selectDate = await showDatePicker(
                              context: context,
                              initialDate: currentDate,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(currentDate.year + 5),
                              builder: (context, child) {
                                return Theme(
                                    data: Theme.of(context).copyWith(
                                        colorScheme: ColorScheme.light(
                                            primary: primaryColor)),
                                    child: child!);
                              });
                          setState(() {
                            if (selectDate != null) {
                              _dueDate = selectDate;
                              DateFormat('dd-MM-yyyy').format(_dueDate);
                            }
                          });
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'GAMBAR PELANGGARAN',
                    style:
                        robotoBesarHitam.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  GestureDetector(
                    onTap: () {
                      getFile();
                    },
                    child: Container(
                      height: 100,
                      width: 300,
                      color: whiteColor,
                      child: Center(
                        child: _imageBuktiPelanggaran != null
                            ? Text(_imageBuktiPelanggaran!)
                            : Text(
                                'PILIH GAMBAR',
                                style: robotoSedangHitam.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      tambahData();
                    },
                    child: Center(
                      child: Container(
                        width: 240,
                        height: 48,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(48),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: whiteColor,
                            ),
                            Text(
                              'TAMBAH',
                              style: robotoSedangPutih.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
