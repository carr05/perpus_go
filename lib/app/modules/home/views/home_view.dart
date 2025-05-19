import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Judul Halaman
              Text(
                'Halaman utama',
                style: TextStyle(
                  fontFamily: 'fredoka',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF293C82),
                ),
              ),
              const SizedBox(height: 16),

              // Tombol Menu
              Row(
                children: [
                  Expanded(child: 
                  menuButton("assets/images/pinjam.png", "Pinjam Buku", Colors.blue[900]!)),
                  const SizedBox(width: 8),
                  Expanded(child: menuButton("assets/images/kembali.png", "Pengembalian Buku", Colors.orange)),
                  const SizedBox(width: 8),
                  Expanded(child: menuButton("assets/images/ebook.png", "E-Book", Colors.blueGrey)),
                ],
              ),

              const SizedBox(height: 20),

              // Katalog Buku
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red[400],
                  borderRadius: BorderRadius.circular(12),
                  
                ),
                child: Row(
                  children: [
                    Image.asset("assets/images/katalog.png", height: 40),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Katalog Buku",
                          style: TextStyle(
                            fontFamily: 'fredoka',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Buku buku yang tersedia",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Rekomendasi Buku
              Text(
                'Rekomendasi Buku',
                style: TextStyle(
                  fontFamily: 'fredoka',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF293C82),
                ),
              ),
              const SizedBox(height: 12),

              buildBookSection('Ilmu pengetahuan', [
                'assets/images/bukuip.png',
                'assets/images/bukuip2.png',
                'assets/images/bukuip3.png',
                'assets/images/bukuip4.png',
              ]),
              buildBookSection('Fiksi', [
                'assets/images/bukuf.png',
                'assets/images/bkuf2.png',
                'assets/images/bukuf3.png',
                'assets/images/bukuf4.png',
              ], backgroundColor: Colors.orange),
              buildBookSection('Ensiklopedia', [
                'assets/images/bukuensi.png',
                'assets/images/bukuensi2.png',
                'assets/images/bukuensi3.png',
                'assets/images/bukuensi4.png',
              ]),
            ],
          ),
        ),
      ),
    );
  }

  // Tombol menu dengan gambar lebih besar
  Widget menuButton(String asset, String label, Color color) {
    return Container(
      height: 150, // container diperbesar agar gambar muat
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            asset,
            height: 80,
            width: 80,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'fredoka',
              color: Colors.white,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  // Bagian rekomendasi buku
  Widget buildBookSection(String title, List<String> images, {Color backgroundColor = const Color(0xFFFF7043)}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'fredoka',
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: images.map((img) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Image.asset(
                    img,
                    height: 115, // ubah sesuai kebutuhan
                    width: 90,   // tambahkan ini jika ingin lebar tetap
                    fit: BoxFit.cover, // atau BoxFit.contain sesuai preferensi
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 90,
                      height: 500,
                      color: Colors.white,
                      child: const Icon(Icons.broken_image),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
