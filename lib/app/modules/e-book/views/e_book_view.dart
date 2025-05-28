import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

class EbookView extends StatefulWidget {
  const EbookView({Key? key}) : super(key: key);

  @override
  State<EbookView> createState() => _EbookViewState();
}

class _EbookViewState extends State<EbookView> {
  String selectedCategory = 'Semua';

  final Map<String, List<Map<String, String>>> allBooks = {
    'Ilmu Pengetahuan Alam': [
  {
    "image": "assets/images/ipa7-1.jpeg",
    "title": "IPA Kelas 7 Semester 1",
    "description": "Buku ini membahas materi Ilmu Pengetahuan Alam untuk kelas 7 semester 1.",
    "pdf": "https://static.buku.kemdikbud.go.id/content/pdf/bukuteks/kurikulum21/IPA-BS-KLS%20VII.pdf"
  },
  {
    "image": "assets/images/ipa7-2.jpg",
    "title": "IPA Kelas 7 Semester 2",
    "description": "Buku ini membahas materi Ilmu Pengetahuan Alam untuk kelas 7 semester 2.",
    "pdf": "https://static.buku.kemdikbud.go.id/content/pdf/bukuteks/kurikulum21/IPA-BS-KLS%20VII.pdf"
  },
  {
    "image": "assets/images/ipa8-1.jpeg",
    "title": "IPA Kelas 8 Semester 1",
    "description": "Buku ini membahas materi Ilmu Pengetahuan Alam untuk kelas 8 semester 1.",
    "pdf": "https://static.buku.kemdikbud.go.id/content/pdf/bukuteks/k13/bukusiswa/Kelas%208%20IPA%20BS%20Sem%201%20press.pdf"
  },
  {
    "image": "assets/images/ipa8-2.jpeg",
    "title": "IPA Kelas 8 Semester 2",
    "description": "Buku ini membahas materi Ilmu Pengetahuan Alam untuk kelas 8 semester 2.",
    "pdf": "https://repositori.kemdikbud.go.id/7019/1/buku%20siswa%20IPA%20semester%202.pdf"
  },
  {
    "image": "assets/images/ipa9-1.jpeg",
    "title": "IPA Kelas 9 Semester 1",
    "description": "Buku ini membahas materi Ilmu Pengetahuan Alam untuk kelas 9 semester 1.",
    "pdf": "https://static.buku.kemdikbud.go.id/content/pdf/bukuteks/k13/bukusiswa/Kelas%209%20IPA%20BS%20Sem1%20press.pdf"
  },
  {
    "image": "assets/images/ipa9-2.png",
    "title": "IPA Kelas 9 Semester 2",
    "description": "Buku ini membahas materi Ilmu Pengetahuan Alam untuk kelas 9 semester 2.",
    "pdf": "https://static.buku.kemdikbud.go.id/content/pdf/bukuteks/k13/bukusiswa/Kelas%209%20IPA%20BS%20Sem2%20press.pdf"
  },
],
    'Ilmu Pengetahuan Sosial': [
      {"image": "assets/assets/images/ips7.jpeg", 
      "title": "IPS Kelas 7",
      "description": "Buku ini membahas materi Ilmu Pengetahuan Sosial untuk siswa kelas 7",
      "pdf": "https://static.buku.kemdikbud.go.id/content/pdf/bukuteks/k13/bukusiswa/IPS%20SMP%20Kelas%207%20BG%20press.pdf"},
      {"image": "assets/assets/images/ips8.jpeg", 
      "title": "IPS Kelas8",
      "description": "Buku ini membahas materi Ilmu Pengetahuan Sosial untuk siswa kelas 8",
      "pdf": "https://repositori.kemdikbud.go.id/7020/1/buku%20siswa%20IPS.pdf"},
      {"image": "assets/assets/images/ips9.jpeg", 
      "title": "IPS Kelas 9",
      "description": "Buku ini membahas materi Ilmu Pengetahuan Sosial untuk siswa kelas 9",
      "pdf": "https://static.buku.kemdikbud.go.id/content/pdf/bukuteks/k13/bukusiswa/Kelas%209%20IPS%20BS%20press.pdf"},
    ],
    'Seni Budaya': [
      {"image": "assets/assets/images/sb7.jpeg", 
      "title": "Seni Budaya Kelas 7",
      "description": "Buku ini membahas materi Seni Budaya untuk siswa kelas 7",
      "pdf": "https://static.buku.kemdikbud.go.id/content/pdf/bukuteks/k13/bukusiswa/Senbud%20SMP%20Kelas%207%20BS%20press.pdf"},
      {"image": "assets/assets/images/sb8.jpeg", 
      "title": "Seni Budaya Kelas 8",
      "description": "buku ini membahas materi seni budaya untuk siswa kelas 8",
      "pdf": "https://mirror.unpad.ac.id/bse/Kurikulum_2013/Siswa/Kelas_08_SMP_Seni_Budaya_Siswa.pdf"},
      {"image": "assets/assets/images/sb9.jpeg", 
      "title": "Seni Budaya Kelas 9",
      "description": "Buku ini membahas materi tentang seni budaya untuk siswa kelas 9",
      "pdf": "https://static.buku.kemdikbud.go.id/content/pdf/bukuteks/k13/bukusiswa/Kelas%209%20Seni%20Budaya%20BS%20press.pdf"},
    ],
    'Agama': [
      {"image": "assets/assets/images/agama7.jpeg", 
      "title": "Agama Kelas 7",
      "description": "Buku ini membahas tentang materi Agama islam Untuk siswa kelas 7",
      "pdf": "https://static.buku.kemdikbud.go.id/content/pdf/bukuteks/k13/bukusiswa/Kelas%20VII%20PAI%20BS%20press.pdf"},
      {"image": "assets/assets/images/agama8.jpeg", 
      "title": "Agama Kelas 8",
      "description": "Buku ini membahs tentang materi Agama Islam untuk siswa kelas 8",
      "pdf": "https://static.buku.kemdikbud.go.id/content/pdf/bukuteks/k13/bukusiswa/Kelas%20VIII%20Islam%20BG%20press.pdf"},
      {"image": "assets/assets/images/agama9.jpeg", 
      "title": "Agama Kelas 9",
      "description": "Buku ini membahas materi Agama Islam untuk siswa kelas 9",
      "pdf": "https://static.buku.kemdikbud.go.id/content/pdf/bukuteks/k13/bukusiswa/Kelas%20IX%20PAI%20BS%20press.pdf"},
    ],
    'Matematika': [
      {"image": "assets/assets/images/mat7.jpeg", "title": "Matematika Kelas 7",
      "description": "Buku ini membahas materi Matematika untuk kelas 7",
      "pdf": "https://static.buku.kemdikbud.go.id/content/pdf/bukuteks/k13/bukusiswa/Matematika%20Sm1%20SMP%20Kelas%207%20BS%20press.pdfhttps://static.buku.kemdikbud.go.id/content/pdf/bukuteks/k13/bukusiswa/Matematika%20Sm1%20SMP%20Kelas%207%20BS%20press.pdf"},
      {"image": "assets/assets/images/mat8.jpeg", "title": "Matematika kelas 8",
      "description": "Buku ini membahas materi Matematika untuk kelas 8",
      "pdf": "https://static.buku.kemdikbud.go.id/content/pdf/bukuteks/k13/bukusiswa/Kelas%208%20Matematika%20BS%20Sem%201%20press.pdf"},
      {"image": "assets/assets/images/mat9.jpeg", "title": "Matematika Kelas 9",
      "description":"buku ini membahas materi Matematika untuk kelas 9",
      "pdf": "https://static.buku.kemdikbud.go.id/content/pdf/bukuteks/k13/bukusiswa/Kelas%209%20MATEMATIKA%20BS%20press.pdf"},
    ],
    'PJOK': [
      {"image": "assets/assets/images/pjok7.jpeg", "title": "PJOK Kelas 7",
      "description": "Buku ini membahas tentang materi Pendidikan jasmani olahraga dan kesehatan untuk siswa kelas 7",
      "pdf": "https://static.buku.kemdikbud.go.id/content/pdf/bukuteks/k13/bukusiswa/PJOK%20SMP%20Kelas%207%20BS%20press.pdf"},
      {"image": "assets/assets/images/pjok8.jpeg", "title": "PJOK kelas 8",
      "description": "Buku ini membahas tentang materi pendidikan jasmanu olahraga dan kesehatan untuk siswa kelas 8",
      "pdf": "https://static.buku.kemdikbud.go.id/content/pdf/bukuteks/k13/bukusiswa/PJOK%20SMP%20Kelas%207%20BS%20press.pdf"},
      {"image": "assets/assets/images/pjok9.jpeg", "title": "PJOK Kelas 9",
      "description": "Buku ini membahas tentang materi pendidikan jasmani olahraga dan kesehatan untuk siswa kelas 9",
      "pdf": "https://static.buku.kemdikbud.go.id/content/pdf/bukuteks/k13/bukusiswa/Kelas%209%20PJOK%20BS%20press.pdf"},
    ],
    'Prakarya': [
      {"image": "assets/assets/images/prakarya7.jpeg", "title": "Prakarya Kelas 7"},
      {"image": "assets/assets/images/prakarya8.jpeg", "title": "Prakarya kelas 8"},
      {"image": "assets/assets/images/prakarya9.jpeg", "title": "Prakarya Kelas 9"},
    ],
    'Bahasa Indonesia': [
      {"image": "assets/assets/images/bi7.jpeg", "title": "Bahasa Indonesia Kelas 7"},
      {"image": "assets/assets/images/bi8.jpeg", "title": "Bahasa Indonesia Kelas 8"},
      {"image": "assets/assets/images/bi9.jpeg", "title": "Bahasa Indonsia Kelas 9"},
    ],
    'Bahasa Inggris': [
      {"image": "assets/assets/images/bing7.jpeg", "title": "Bahasa Inggris Kelas 7"},
      {"image": "assets/assets/images/bing8.jpeg", "title": "Bahasa Inggris Kelas 8"},
      {"image": "assets/assets/images/bing9.jpeg", "title": "Bahasa Inggris Kelas 9"},
    ],
    'Bahasa Jawa': [
      {"image": "assets/assets/images/bj7.jpeg", "title": "Bahasa Jawa Kelas 7"},
      {"image": "assets/assets/images/bj8.jpeg", "title": "Bahasa Jawa Kelas 8"},
      {"image": "assets/assets/images/bj9.jpeg", "title": "Bahasa Jawa Kelas 9"},
    ],
  };

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> booksToShow;

    if (selectedCategory == 'Semua') {
      // Gabungkan semua buku lalu acak urutannya
      booksToShow = allBooks.values.expand((b) => b).toList();
      booksToShow.shuffle(Random());
    } else {
      booksToShow = allBooks[selectedCategory]!;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  const Text(
                    "E-Book",
                    style: TextStyle(
                      fontFamily: 'fredoka',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF293C82),
                    ),
                  ),
                  const Spacer(),
                  Image.asset("assets/images/ebok.jpg", height: 200),
                ],
              ),

              const SizedBox(height: 20),

              // Filter kategori
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: ['Semua', ...allBooks.keys].map((category) {
                    final isSelected = selectedCategory == category;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ChoiceChip(
                        label: Text(category),
                        selected: isSelected,
                        onSelected: (_) {
                          setState(() => selectedCategory = category);
                        },
                        selectedColor: const Color(0xFF293C82),
                        backgroundColor: Colors.grey.shade300,
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontFamily: 'nunito',
                          fontSize: 16,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 20),

              // Buku grid
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: booksToShow.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.6,
                  ),
                 itemBuilder: (context, index) {
  final book = booksToShow[index];
  return GestureDetector(
    onTap: () {
      Get.toNamed('/buku', arguments: book);
    },
    child: Column(
      children: [
        Image.asset(
          book["image"]!,
          height: 200,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 5),
        Text(
          book["title"]!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: 'nunito',
          ),
        ),
      ],
    ),
  );
},

                ),
              ),
            ],
          ),
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
