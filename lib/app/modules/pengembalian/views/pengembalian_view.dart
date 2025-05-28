import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PengembalianView extends StatelessWidget {
  const PengembalianView({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = Get.arguments ?? {};

    final String title = args['title'] ?? 'Tidak ada judul';
    final String pinjam = args['pinjam'] ?? '-';
    final String kembali = args['kembali'] ?? '-';
    final String image = args['image'] ?? 'assets/images/default_book.png';
    final int colorValue = args['color'] ?? 0xFF0A197D;

    final Color mainColor = Color(colorValue);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F9FC),
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text(
          'Pengembalian Buku',
          style: TextStyle(fontFamily: 'fredoka', color: Color(0xFFF6F9FC)),
        ),
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Card info buku
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              shadowColor: mainColor.withOpacity(0.3),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Judul buku dengan icon
                    Row(
                      children: [
                        Icon(Icons.menu_book, color: mainColor, size: 28),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: mainColor,
                              fontFamily: 'fredoka',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Tanggal Pinjam
                    Row(
                      children: [
                        Icon(Icons.calendar_today, color: mainColor),
                        const SizedBox(width: 12),
                        Text(
                          'Tanggal Pinjam: ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: mainColor,
                          ),
                        ),
                        Text(pinjam),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Tanggal Kembali
                    Row(
                      children: [
                        Icon(Icons.calendar_view_day, color: mainColor),
                        const SizedBox(width: 12),
                        Text(
                          'Tanggal Kembali: ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: mainColor,
                          ),
                        ),
                        Text(kembali),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            // Gambar buku dengan border radius dan shadow
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: mainColor.withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  image,
                  height: 220,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return Container(
                      color: Colors.grey[300],
                      height: 220,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: const Icon(Icons.book, size: 80, color: Colors.grey),
                    );
                  },
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
}
