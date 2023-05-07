import 'package:flutter/material.dart';
import 'package:nilangsis_mini_project_alterra/model/data_pelanggaran.dart';
import 'package:nilangsis_mini_project_alterra/widget/theme.dart';

class CardPelanggaran extends StatelessWidget {
  const CardPelanggaran({Key? key, required this.data}) : super(key: key);

  final DataPelanggaran data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: secondaryColor),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Text('Nama : ${data.namaSiswa}',
                    style:
                        robotoKecilHitam.copyWith(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Text('Kelas : ${data.kelas}',
                    style:
                        robotoKecilHitam.copyWith(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Text('Nama Pelanggaran : ${data.namaPelanggaran}',
                    style:
                        robotoKecilHitam.copyWith(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Text('Tanggal : ${data.tanggalKejadian}',
                    style:
                        robotoKecilHitam.copyWith(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
