import 'package:flutter/material.dart'; // <- Tambahkan ini
import 'package:get/get.dart';

class RegisterController extends GetxController {
  // Controller untuk input field
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  void register() {
    // Validasi atau simpan data bisa dilakukan di sini
    if (usernameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        phoneController.text.isNotEmpty) {
      // Simulasi register berhasil
      Get.toNamed('/home'); // Pastikan route /home sudah dibuat
    } else {
      Get.snackbar('Error', 'Harap lengkapi semua data');
    }
  }
}
