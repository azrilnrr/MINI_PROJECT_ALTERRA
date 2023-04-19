import 'package:flutter/material.dart';
import 'package:nilangsis_mini_project_alterra/view/home_screen.dart';
import 'package:nilangsis_mini_project_alterra/view/tambah_data_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NILANGIS',
      home: HomeScreen(),
    );
  }
}
