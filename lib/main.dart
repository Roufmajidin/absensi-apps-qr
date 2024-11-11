import 'dart:io';

import 'package:absenku_pintar/absensi.dart';
import 'package:absenku_pintar/detail_screen.dart';
import 'package:absenku_pintar/function/function.dart';
import 'package:absenku_pintar/login_screen.dart';
import 'package:absenku_pintar/widgets/LoginCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QRScannerProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FutureBuilder<bool>(
          future: _checkLoginStatus(),
          builder: (context, snapshot) {
            return DetailScreen();
            // if (snapshot.connectionState == ConnectionState.waiting) {
            //   return const CircularProgressIndicator();
            // } else if (snapshot.hasData && snapshot.data == true) {
            //   return const MyHomePage(title: 'Absensi',);
            // } else {
            //   return loginScreen();
            // }
          },
        ),
      ),
    );
  }

  Future<bool> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? nama = prefs.getString('nama');
    String? nim = prefs.getString('nim');
    return nama != null && nama.isNotEmpty && nim != null && nim.isNotEmpty;
  }
}
