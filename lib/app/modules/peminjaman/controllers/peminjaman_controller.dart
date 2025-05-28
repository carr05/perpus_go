import 'package:get/get.dart';
import 'package:flutter/material.dart';

class PeminjamanController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  // Text editing controllers
  final namaC = ''.obs;
  final judulC = ''.obs;
  final tanggalC = ''.obs;
  final passwordC = ''.obs;

  @override
  void onClose() {
    passwordController.dispose();
    super.onClose();
  }
  
}


