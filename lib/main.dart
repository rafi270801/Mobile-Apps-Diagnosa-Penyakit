import 'package:flutter/material.dart';
import 'package:flutter_diagnosa_penyakit/view/auth/login_page.dart';
import 'package:flutter_diagnosa_penyakit/view/base_page.dart';
import 'package:flutter_diagnosa_penyakit/view/splash_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
