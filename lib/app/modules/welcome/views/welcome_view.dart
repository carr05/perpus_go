import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perpus_go/app/routes/app_pages.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F8FC),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/reading.png', // sesuaikan dengan asset kamu
              height: 250,
            ),
            SizedBox(height: 30),
            Text(
              'SELAMAT DATANG !',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1D2951),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            Text(
              'Aplikasi Perpustakaan Online ini dirancang untuk memberikan solusi digital yang praktis dalam mengelola koleksi buku, pencarian, peminjaman, serta pengembalian secara efisien dan terintegrasi.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1D2951),
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              onPressed: () {
                Get.toNamed(Routes.LOGIN);
              },
              child: Text('Mulai Sekarang!', style: TextStyle(fontSize: 16, color: Color(0xFFF7F8FC) )),
            ),
          ],
        ),
      ),
    );
  }
}
