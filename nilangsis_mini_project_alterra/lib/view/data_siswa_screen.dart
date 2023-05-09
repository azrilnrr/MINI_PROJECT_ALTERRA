import 'package:flutter/material.dart';
import 'package:nilangsis_mini_project_alterra/routes/routes.dart';
import 'package:nilangsis_mini_project_alterra/view/tambah_data_screen.dart';
import 'package:nilangsis_mini_project_alterra/view_model/data_siswa_provider.dart';
import 'package:nilangsis_mini_project_alterra/widget/card_siswa.dart';
import 'package:nilangsis_mini_project_alterra/widget/theme.dart';
import 'package:provider/provider.dart';

class DataSiswaScreen extends StatefulWidget {
  @override
  State<DataSiswaScreen> createState() => _DataSiswaScreenState();
}

class _DataSiswaScreenState extends State<DataSiswaScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<DataSiswaProvider>(context, listen: false)
            .getAllDataSiswa());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: thirdColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'DATA SISWA',
          style: robotoBesarPutih.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Consumer<DataSiswaProvider>(
        builder: (context, prov, child) {
          if (prov.requestState == RequestState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (prov.requestState == RequestState.loaded) {
            final dp = prov.datasiswa;
            return ListView.builder(
              itemCount: dp.length,
              itemBuilder: (BuildContext context, int index) {
                final data = dp[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TambahData(dataSiswa: data)),
                        ModalRoute.withName(AppRoutes.home));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CardSiswa(data: data),
                  ),
                );
              },
            );
          } else if (prov.requestState == RequestState.error) {
            return Text(prov.message);
          } else {
            return const Text('Unknown error');
          }
        },
      ),
    );
  }
}
