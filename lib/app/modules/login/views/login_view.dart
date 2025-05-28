import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perpus_go/app/routes/app_pages.dart';
import '../controllers/login_controller.dart';
import 'package:flutter/gestures.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 60),
        child: Column(
          children: [
            Image.asset(
              'assets/images/logn.png',
              height: 180,
            ),
            SizedBox(height: 30),
            // Judul
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'fredoka',
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 24),
            // Input email
            _buildInputField(
              iconPath: 'assets/icon/person.png',
              hintText: 'Nama Pengguna',
              controller: controller.emailController,
            ),
            SizedBox(height: 16),
            // Input password dengan "Forgot?"
            Stack(
              children: [
                _buildInputField(
                  iconPath: 'assets/icon/password.png',
                  hintText: 'Password',
                  controller: controller.passwordController,
                  obscure: true,
                  
                ),
                
              ],
            ),
            SizedBox(height: 24),
            // Tombol login
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0A0A63),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'fredoka'),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'atau login dengan...',
              style: TextStyle(color: Colors.black54),
            ),
            SizedBox(height: 16),
            // Tombol sosial
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialIcon('assets/icon/google.png'),
                SizedBox(width: 16),
                _buildSocialIcon('assets/icon/facebook.png'),
                SizedBox(width: 16),
                _buildSocialIcon('assets/icon/tweeter.png'),
              ],
            ),
            SizedBox(height: 24),
            // Daftar
            RichText(
              text: TextSpan(
                text: 'Belum Memiliki akun? ',
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: 'Daftar Sekarang',
                    style: TextStyle(
                      color: Color(0xFF3E6D9C),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.toNamed(Routes.REGISTER);
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Input field builder
  Widget _buildInputField({
    required String iconPath,
    required String hintText,
    required TextEditingController controller,
    bool obscure = false,
    String? suffixIconPath,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(iconPath, width: 24, height: 24),
        ),
        suffixIcon: suffixIconPath != null
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(suffixIconPath, width: 24, height: 24),
              )
            : null,
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: EdgeInsets.symmetric(vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  /// Social Icon
  Widget _buildSocialIcon(String assetPath) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(10),
      child: Image.asset(assetPath),
    );
  }
}
