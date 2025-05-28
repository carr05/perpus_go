import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class BukuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments ?? {};

    final String image = args['image'] ?? 'assets/images/default_book.png';
    final String title = args['title'] ?? 'Judul Tidak Diketahui';
    final String author = args['author'] ?? 'Pengarang Tidak Diketahui';
    final String description = args['description'] ?? 'Tidak ada deskripsi.';
    final String? pdfPath = args['pdf'];

    const Color primaryBlue = Color(0xFF293C82);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryBlue,
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'fredoka',
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 23,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // BAGIAN ATAS: GAMBAR + INFO BUKU
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    image,
                    height: 180,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontFamily: 'fredoka',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: primaryBlue,
                         height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'by $author',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[700],
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () {
                          Get.toNamed('/peminjaman', arguments: args);
                        },
                        icon: const Icon(Icons.library_books, color:Colors.white),
                        label: const Text(
                          "Pinjam Buku",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryBlue,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                          elevation: 0,
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Deskripsi Buku',
              style: TextStyle(
                fontFamily: 'fredoka',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryBlue,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  description,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),

            // Tombol PDF di bawah sendiri, full lebar dan terpisah
            if (pdfPath != null && pdfPath.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      final Uri url = Uri.parse(pdfPath);
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url,
                            mode: LaunchMode.externalApplication);
                      } else {
                        Get.snackbar(
                          "Error",
                          "Tidak dapat membuka PDF.",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red.shade700,
                          colorText: Colors.white,
                        );
                      }
                    },
                    icon: const Icon(Icons.picture_as_pdf, size: 26),
                    label: const Text(
                      "Buka PDF Buku",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
