import 'package:flutter/material.dart';
import 'package:nilangsis_mini_project_alterra/widget/theme.dart';

class CardPelanggaran extends StatelessWidget {
  const CardPelanggaran({Key? key}) : super(key: key);

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
                width: 50,
                child: Text('NAMA : ',
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
                width: 50,
                child: Text('KELAS : ',
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
                width: 120,
                child: Text('PELANGGARAN : ',
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
                width: 100,
                child: Text('TANGGAL : ',
                    style:
                        robotoKecilHitam.copyWith(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
