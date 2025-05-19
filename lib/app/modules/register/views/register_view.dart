import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perpus_go/app/routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            Image.asset(
              'assets/images/register.png',
              height: 250,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(45),
              decoration: BoxDecoration(
                color: Color(0xFF3E6D9C),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Daftar sekarang',
                    style: TextStyle(
                      fontFamily: 'fredoka',
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Buatlah akun untuk mendapatkan semua fitur',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 20),

                  _buildImageInputField(
                    'assets/icon/person.png',
                    'Nama Pengguna',
                    controller.usernameController,
                  ),
                  SizedBox(height: 14),
                  _buildImageInputField(
                    'assets/icon/email.png',
                    'Email',
                    controller.emailController,
                  ),
                  SizedBox(height: 14),
                  _buildImageInputField(
                    'assets/icon/password.png',
                    'Password',
                    controller.passwordController,
                    obscure: true,
                  ),
                  SizedBox(height: 14),
                  _buildImageInputField(
                    'assets/icon/telephone.png',
                    'No. Telepon',
                    controller.phoneController,
                  ),

                  SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      onPressed: controller.register,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF001253),
                        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text("Register", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                    
                  ),

                  SizedBox(height: 16),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Sudah Memiliki akun? ", style: TextStyle(color: Colors.white)),
                        GestureDetector(
                          onTap: () => Get.toNamed(Routes.LOGIN),
                          child: Text("Login Sekarang", style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  Divider(color: Colors.white),
                  SizedBox(height: 10),
                  Center(
                    child: Text("Login dengan", style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 10),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Field input dengan prefix image
  Widget _buildImageInputField(
    String iconPath,
    String hint,
    TextEditingController controller, {
    bool obscure = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(iconPath, width: 24, height: 24),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  /// Icon sosial media
  Widget _buildSocialIcon(String assetPath) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 20,
      child: Image.asset(assetPath, width: 24, height: 24),
    );
  }
}
