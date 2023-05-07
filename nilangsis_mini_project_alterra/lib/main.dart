import 'package:flutter/material.dart';
import 'package:nilangsis_mini_project_alterra/view/home_screen.dart';
import 'package:nilangsis_mini_project_alterra/view_model/data_pelanggaran_provider.dart';
import 'package:nilangsis_mini_project_alterra/view_model/data_siswa_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DataPelanggaranProvider(),
        ),
        ChangeNotifierProvider(create: (context) => DataSiswaProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'nilangsis',
        home: HomeScreen(),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'NILANGIS',
//       home: HomeScreen(),
//       // home: TambahData(),
//     );
//   }
// }
