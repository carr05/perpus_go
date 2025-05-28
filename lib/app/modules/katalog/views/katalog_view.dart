import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/katalog_controller.dart';

class KatalogBukuView extends GetView<KatalogBukuController> {
  const KatalogBukuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF001253),
      
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Row(
                children: [
                  const Text(
                    "Katalog Buku",
                    style: TextStyle(
                      fontFamily: 'fredoka',
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Image.asset("assets/images/katalog2.png", width: 150),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xFFF7F9FB),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: ListView(
                  children: [
                    const Text(
                      "Koleksi Buku Terbaru",
                      style: TextStyle(
                        fontFamily: 'fredoka',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF001253),
                      ),
                    ),
                    buildBookGrid(controller.bukuTerbaru),
                    const SizedBox(height: 16),
                    const Text(
                      "Koleksi Buku Terpopuler",
                      style: TextStyle(
                        fontFamily: 'fredoka',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF001253),
                      ),
                    ),
                    buildBookGrid(controller.bukuTerpopuler),
                  ],
                ),
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

  // Fungsi buildBookGrid yang benar
  Widget buildBookGrid(List<String> images) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 0.65, // rasio tinggi vs lebar
        shrinkWrap: true,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        physics: const NeverScrollableScrollPhysics(),
        children: images.map((img) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              height: 180,
              width: 120,
              child: Image.asset(
                img,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[200],
                  child: const Icon(Icons.broken_image),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
