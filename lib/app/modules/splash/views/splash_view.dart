import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashView extends StatelessWidget {
  final SplashController controller = Get.put(SplashController()); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7FAFF), // Ganti warna latar belakang sesuai branding
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gambar Logo
            Image.asset(
              'assets/images/logo-splash.png',
              width: 200,
            ),
            SizedBox(height: 20),
            // Loading Indicator
            CircularProgressIndicator(color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
