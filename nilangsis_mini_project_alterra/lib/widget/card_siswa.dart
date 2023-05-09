import 'package:flutter/material.dart';
import 'package:nilangsis_mini_project_alterra/model/data_siswa.dart';
import 'package:nilangsis_mini_project_alterra/widget/theme.dart';

class CardSiswa extends StatelessWidget {
  const CardSiswa({Key? key, required this.data}) : super(key: key);

  final DataSiswa data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: secondaryColor),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: primaryColor,
          child: Text(
            data.namaSiswa[0],
            style: robotoBesarPutih,
          ),
        ),
        title: Text(
          'Nama : ${data.namaSiswa}',
          style: robotoBesarHitam,
        ),
        subtitle: Text(
          'Kelas : ${data.kelas}',
          style: robotoSedangHitam,
        ),
      ),
    );
  }
}
