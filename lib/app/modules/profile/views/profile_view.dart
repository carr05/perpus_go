import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../editprofile/views/editprofile_view.dart'; // import halaman edit

class ProfilView extends StatelessWidget {
  const ProfilView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F9FC),
      
      body: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 60, bottom: 30, left: 20, right: 20),
            decoration: const BoxDecoration(
              color: Color(0xFF293C82),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Profil',
                      style: TextStyle(
                        fontFamily: 'fredoka',
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.white),
                      onPressed: () {
                        Get.to(() => EditProfileView());
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/images/profile.png"),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Dianne Russell',
                  style: TextStyle(
                    fontFamily: 'fredoka',
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Informasi Kontak
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: const [
                InfoCard(
                  icon: Icons.email,
                  label: 'Email',
                  value: 'diannerusell@gmail.com',
                ),
                InfoCard(
                  icon: Icons.phone,
                  label: 'No. Telepon',
                  value: '+62823456789',
                ),
                InfoCard(
                  icon: Icons.alternate_email,
                  label: 'Twitter',
                  value: '@Dianne123',
                ),
                InfoCard(
                  icon: Icons.facebook,
                  label: 'Facebook',
                  value: 'www.facebook.com/dianne123',
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/peminjaman'),
        backgroundColor: const Color(0xFF293C82),
        child: const Icon(Icons.library_add, color: Colors.white),
      ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: const Icon(Icons.home), onPressed: () => Get.toNamed('/home')),
            IconButton(icon: const Icon(Icons.person), onPressed: () => Get.toNamed('/profile')),
            const SizedBox(width: 40), // space for FAB
            IconButton(icon: const Icon(Icons.notifications), onPressed: () => Get.toNamed('/notification')),
            IconButton(icon: const Icon(Icons.menu_book), onPressed: () => Get.toNamed('/pengembalian')),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF4FF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.black),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'fredoka',
                    color: Colors.black54,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'fredoka',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
