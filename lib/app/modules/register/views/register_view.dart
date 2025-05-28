import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perpus_go/app/routes/app_pages.dart';
import '../controllers/register_controller.dart';
import 'package:flutter/gestures.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 60),
        child: Column(
          children: [
            Image.asset(
              'assets/images/regis.png',
              height: 180,
            ),
            SizedBox(height: 30),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Register',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'fredoka',
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 24),

            _buildInputField(
              iconPath: 'assets/icon/person.png',
              hintText: 'Nama Pengguna',
              controller: controller.usernameController,
            ),
            SizedBox(height: 16),

            _buildInputField(
              iconPath: 'assets/icon/email.png',
              hintText: 'Email',
              controller: controller.emailController,
            ),
            SizedBox(height: 16),

            _buildInputField(
              iconPath: 'assets/icon/password.png',
              hintText: 'Password',
              controller: controller.passwordController,
              obscure: true,
              
            ),
            SizedBox(height: 16),

            _buildInputField(
              iconPath: 'assets/icon/telephone.png',
              hintText: 'No. Telepon',
              controller: controller.phoneController,
            ),
            SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.register,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0A0A63),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'fredoka',
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            Text(
              'atau daftar dengan...',
              style: TextStyle(color: Colors.black54),
            ),
            SizedBox(height: 16),

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
            RichText(
              text: TextSpan(
                text: 'Sudah memiliki akun? ',
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: 'Login Sekarang',
                    style: TextStyle(
                      color: Color(0xFF3E6D9C),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.toNamed(Routes.LOGIN);
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
