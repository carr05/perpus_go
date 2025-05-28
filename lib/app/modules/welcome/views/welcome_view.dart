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
            Text(
              'SELAMAT DATANG !',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'fredoka',
                fontWeight: FontWeight.bold,
                color: Color(0xFF1D2951),
              ),
            ),
            Image.asset(
              'assets/images/reading.png', 
              height: 250,
            ),
            SizedBox(height: 30),
        
            SizedBox(height: 15),
            Text(
              'Aplikasi ini mempermudah pengelolaan dan peminjaman buku secara online.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18,fontFamily: 'nunito', color: Colors.black87),
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
              child: Text('Mulai Sekarang!', style: TextStyle(fontSize: 17,fontFamily: 'fredoka', color: Color(0xFFF7F8FC) )),
            ),
          ],
        ),
      ),
    );
  }
}
