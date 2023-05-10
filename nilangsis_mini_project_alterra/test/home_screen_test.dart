import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nilangsis_mini_project_alterra/routes/routes.dart';
import 'package:nilangsis_mini_project_alterra/view/home_screen.dart';
import 'package:nilangsis_mini_project_alterra/view_model/data_pelanggaran_provider.dart';
import 'package:nilangsis_mini_project_alterra/view_model/data_siswa_provider.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Judul halaman harus NILANGSIS', (WidgetTester tester) async {
    //testing judul
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DataPelanggaranProvider(),
        ),
        ChangeNotifierProvider(create: (context) => DataSiswaProvider())
      ],
      child: MaterialApp(
        routes: {
          AppRoutes.home: (context) => const HomeScreen(),
        },
      ),
    ));

    expect(find.text('NILANGSIS'), findsOneWidget);
  });
}
