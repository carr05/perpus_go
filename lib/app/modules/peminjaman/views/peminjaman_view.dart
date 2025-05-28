import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PeminjamanView extends StatelessWidget {
  final TextEditingController namaC = TextEditingController();
  final TextEditingController judulC = TextEditingController();
  final TextEditingController tanggalC = TextEditingController();
  final TextEditingController passC = TextEditingController();

  PeminjamanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A197D),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Peminjaman Buku',
                        style: TextStyle(
                          fontFamily: 'fredoka',
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Isi formulir untuk meminjam buku',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Image.asset('assets/images/hal1.png', height: 100),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFFF6F9FC),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Formulir Peminjaman',
                      style: TextStyle(
                        fontFamily: 'fredoka',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0A197D),
                      ),
                    ),
                    const SizedBox(height: 16),
                    inputField('Nama', 'Masukkan nama anda', Icons.person, namaC),
                    inputField('Judul Buku', 'Masukkan judul buku', Icons.book, judulC),
                    dateInputField(context),
                    inputField('Password', 'Masukkan password', Icons.lock, passC),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0A197D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          if (namaC.text.isEmpty ||
                              judulC.text.isEmpty ||
                              tanggalC.text.isEmpty ||
                              passC.text.isEmpty) {
                            Get.snackbar('Gagal', 'Harap lengkapi semua data');
                            return;
                          }

                          try {
                            final DateTime pinjam = DateFormat('yyyy-MM-dd').parse(tanggalC.text);
                            final DateTime kembali = pinjam.add(const Duration(days: 5));
                            final String tglKembali = DateFormat('yyyy-MM-dd').format(kembali);

                            Get.toNamed('/pengembalian', arguments: {
                              'title': judulC.text,
                              'pinjam': tanggalC.text,
                              'kembali': tglKembali,
                              'image': 'assets/images/default_book.png',
                              'color': Colors.orange.value,
                            });

                          } catch (e) {
                            Get.snackbar('Format Tanggal Salah', 'Gunakan format yyyy-MM-dd');
                          }
                        },
                        child: const Text(
                          'Kirim',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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

  Widget inputField(String label, String hint, IconData icon, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          suffixIcon: Icon(icon, color: Colors.grey),
          labelStyle: const TextStyle(
            fontFamily: 'fredoka',
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Color(0xFF0A197D),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  Widget dateInputField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: tanggalC,
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2100),
          );
          if (pickedDate != null) {
            tanggalC.text = DateFormat('yyyy-MM-dd').format(pickedDate);
          }
        },
        decoration: InputDecoration(
          labelText: 'Tanggal Pinjam',
          hintText: 'yyyy-MM-dd',
          suffixIcon: const Icon(Icons.calendar_today, color: Colors.grey),
          labelStyle: const TextStyle(
            fontFamily: 'fredoka',
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Color(0xFF0A197D),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
