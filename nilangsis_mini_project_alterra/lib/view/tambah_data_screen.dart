import 'package:flutter/material.dart';
import 'package:nilangsis_mini_project_alterra/view/data_siswa_screen.dart';
import 'package:nilangsis_mini_project_alterra/widget/theme.dart';

class TambahData extends StatefulWidget {
  const TambahData({super.key});

  @override
  State<TambahData> createState() => _TambahDataState();
}

class _TambahDataState extends State<TambahData> {
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
                        height: 35,
                        child: TextFormField(
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
                    height: 35,
                    child: TextFormField(
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
                    height: 35,
                    child: TextFormField(
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
                        height: 35,
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: whiteColor,
                            hintText: 'Masukkan Tanggal',
                            contentPadding: EdgeInsets.all(5),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: whiteColor)),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        'PILIH',
                        style: robotoSedangHitam.copyWith(
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  Text(
                    'GAMBAR PELANGGARAN',
                    style:
                        robotoBesarHitam.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Container(
                    height: 100,
                    width: 300,
                    color: whiteColor,
                    child: Center(
                        child: Text(
                      'PILIH GAMBAR',
                      style: robotoSedangHitam.copyWith(
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {},
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
