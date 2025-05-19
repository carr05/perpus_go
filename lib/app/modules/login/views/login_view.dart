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
        child: Column(
          children: [
            SizedBox(height: 83),
            Image.asset(
              'assets/images/login.png',
              height: 270,
            ),
            Container(
              padding: EdgeInsets.all(45),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                color: Color(0xFF3E6D9C),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang Kembali',
                    style: TextStyle(
                      fontFamily: 'fredoka',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Mari masuk untuk menjelajah terus',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  _buildInputField(
                    iconPath: 'assets/icon/person.png',
                    hintText: 'Nama Pengguna',
                    controller: controller.emailController,
                  ),
                  SizedBox(height: 16),
                  _buildInputField(
                    iconPath: 'assets/icon/password.png',
                    hintText: 'Password',
                    controller: controller.passwordController,
                    obscure: true,
                    suffixIconPath: 'assets/icon/mata.png',
                  ),
                  SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      onPressed: controller.login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0A0A63),
                        padding: EdgeInsets.symmetric(
                            horizontal: 80, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text('Login',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Belum Memiliki akun? ',
                        style: TextStyle(color: Colors.white),
                        children: [
                          TextSpan(
                            text: 'Daftar Sekarang',
                            style: TextStyle(
                              color: Colors.white,
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
                  ),
                  SizedBox(height: 20),
                  Divider(color: Colors.white70),
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      'Login dengan',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialIcon('assets/icon/google.png'),
                      SizedBox(width: 25),
                      _buildSocialIcon('assets/icon/facebook.png'),
                      SizedBox(width: 25),
                      _buildSocialIcon('assets/icon/tweeter.png'),
                    ],
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
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  /// Social Icon Widget
  Widget _buildSocialIcon(String assetPath) {
    return Container(
      width: 45,
      height: 45,
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
      padding: EdgeInsets.all(8),
      child: Image.asset(
        assetPath,
        fit: BoxFit.contain,
      ),
    );
  }
}
