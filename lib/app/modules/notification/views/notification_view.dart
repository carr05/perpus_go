import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F9FC),
      
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Notifikasi',
              style: TextStyle(
                fontFamily: 'fredoka',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: const [
                  NotificationCard(
                    icon: Icons.calendar_today,
                    title: 'Pengingat',
                    message: 'Jangan lupa untuk mengembalikan buku!',
                  ),
                  NotificationCard(
                    icon: Icons.calendar_today,
                    title: 'Pengingat',
                    message: 'Jangan lupa untuk mengembalikan buku!',
                  ),
                  NotificationCard(
                    icon: Icons.menu_book,
                    title: 'Katalog',
                    message: 'Banyak buku baru sekarang. Ayo lihat!',
                  ),
                  NotificationCard(
                    icon: Icons.menu_book,
                    title: 'Katalog',
                    message: 'Banyak buku baru sekarang. Ayo lihat!',
                  ),
                ],
              ),
            ),
          ],
        ),
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

class NotificationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;

  const NotificationCard({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFDDE6FB),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 28, color: Colors.black),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'fredoka',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 13,
                    fontFamily: 'fredoka',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
