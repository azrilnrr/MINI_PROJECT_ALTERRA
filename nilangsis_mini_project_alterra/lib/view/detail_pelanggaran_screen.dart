import 'package:flutter/material.dart';
import 'package:nilangsis_mini_project_alterra/api/api.dart';
import 'package:nilangsis_mini_project_alterra/model/data_pelanggaran.dart';
import 'package:nilangsis_mini_project_alterra/widget/theme.dart';

class DetailPelanggaranScreen extends StatelessWidget {
  const DetailPelanggaranScreen({super.key, required this.dataPelanggaran});
  final DataPelanggaran? dataPelanggaran;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: thirdColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'DETAIL PELANGGARAN',
          style: robotoBesarPutih.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.network(
            '${DataApi.imgAssets}${dataPelanggaran!.buktiPelanggaran}',
            height: 220,
            width: 330,
          ),
          Text(
            'Tanggal : ${dataPelanggaran!.tanggalKejadian!.substring(0, 10)}',
            style: robotoBesarHitam,
          ),
          SizedBox(height: 10),
          Divider(
            color: Colors.black,
            height: 20,
            thickness: 2,
          ),
          SizedBox(height: 10),
          Text(
            'Nama : ${dataPelanggaran!.namaSiswa}',
            style: robotoBesarHitam,
          ),
          SizedBox(height: 10),
          Text(
            'Kelas : ${dataPelanggaran!.kelas}',
            style: robotoBesarHitam,
          ),
          SizedBox(height: 10),
          Text(
            'Pelanggaran : ${dataPelanggaran!.namaPelanggaran}',
            style: robotoBesarHitam,
          ),
        ]),
      ),
    );
  }
}
