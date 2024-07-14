import 'package:flutter/material.dart';

import '../config/app_color.dart';
import 'base_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToMainScreen();
  }

  void _navigateToMainScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const BasePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //     colors: [
        //       AppColor.colorPrimaryBlue,
        //       AppColor.white,
        //       AppColor.colorSecondBlue
        //     ],
        //   ),
        // ),
        color: AppColor.white,
        child: Center(
          child: Image.asset("assets/logo.jpg", width: 220),
        ),
      ),
    );
  }
}
