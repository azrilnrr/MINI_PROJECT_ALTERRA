import 'package:flutter/material.dart';
import 'package:nilangsis_mini_project_alterra/view/tambah_data_screen.dart';
import 'package:nilangsis_mini_project_alterra/widget/card_pelanggaran.dart';
import 'package:nilangsis_mini_project_alterra/widget/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: thirdColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'NILANGSIS',
          style: robotoBesarPutih,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Text(
                'DATA PELANGGARAN',
                style: robotoBesarHitam.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              CardPelanggaran(),
              SizedBox(height: 20),
              CardPelanggaran(),
              SizedBox(height: 20),
              CardPelanggaran(),
              SizedBox(height: 20),
              CardPelanggaran(),
              SizedBox(height: 20),
            ],
          ),
        ),
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
