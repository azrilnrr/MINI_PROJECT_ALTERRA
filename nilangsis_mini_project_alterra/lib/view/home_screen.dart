import 'package:flutter/material.dart';
import 'package:nilangsis_mini_project_alterra/view/detail_pelanggaran_screen.dart';
import 'package:nilangsis_mini_project_alterra/view/tambah_data_screen.dart';
import 'package:nilangsis_mini_project_alterra/view_model/data_pelanggaran_provider.dart';
import 'package:nilangsis_mini_project_alterra/widget/card_pelanggaran.dart';
import 'package:nilangsis_mini_project_alterra/widget/theme.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<DataPelanggaranProvider>(context, listen: false)
            .getAllDataPelanggaran());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: thirdColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'NILANGSIS',
          style: robotoBesarPutih.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Consumer<DataPelanggaranProvider>(
        builder: (context, prov, child) {
          if (prov.requestState == RequestState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (prov.requestState == RequestState.loaded) {
            final dp = prov.dataPelanggarans;
            return RefreshIndicator(
              onRefresh: () => prov.getAllDataPelanggaran(),
              child: ListView.builder(
                itemCount: dp.length,
                itemBuilder: (BuildContext context, int index) {
                  final data = dp[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailPelanggaranScreen(dataPelanggaran: data),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CardPelanggaran(data: data),
                    ),
                  );
                },
              ),
            );
          } else if (prov.requestState == RequestState.error) {
            return Center(child: Text(prov.message));
          } else {
            return const Text('Unknown error');
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TambahData()));
        },
        label: const Text('TAMBAH'),
        icon: const Icon(Icons.add),
        backgroundColor: primaryColor,
      ),
    );
  }
}
