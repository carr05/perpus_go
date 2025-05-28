import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController searchController = TextEditingController();
  String selectedCategory = 'Semua';

  final List<Map<String, String>> allBooks = [
    {
      'image': 'assets/images/ilmup.jpeg',
      'title': 'Sapiens',
      'author': 'Yuval Noah Harari',
      'description': 'Revolusi kognitif, agrikultur, dan ilmu pengetahuan.',
      'category': 'Ilmu Pengetahuan',
    },
    {
      'image': 'assets/images/bukuip2.png',
      'title': 'Filosofi Teras',
      'author': 'Henry Manampiring',
      'description': 'Pengantar filsafat Stoa untuk anak muda.',
      'category': 'Ilmu Pengetahuan',
    },
    {
      'image': 'assets/images/bukuf3.jpg',
      'title': 'Gadis Kretek',
      'author': 'Ratih Kumala',
      'description': 'Cerita keluarga dan sejarah industri kretek.',
      'category': 'Fiksi',
    },
    {
      'image': 'assets/images/bukuf6.jpg',
      'title': 'Negeri Para Bedebah',
      'author': 'Tere Liye',
      'description': 'Konsultan keuangan menghadapi krisis besar.',
      'category': 'Fiksi',
    },
    {
      'image': 'assets/images/ilmup5.jpeg',
      'title': 'Astrofisika untuk Orang Sibuk',
      'author': 'Neil deGrasse Tyson',
      'description': 'Penjelasan kosmos secara ringkas dan menarik.',
      'category': 'Ilmu Pengetahuan',
    },
    {
      'image': 'assets/images/bukuf5.jpg',
      'title': 'Peter',
      'author': 'Risa Saraswati',
      'description': 'Petualangan supranatural bersama Peter.',
      'category': 'Fiksi',
    },
  ];

  List<Map<String, String>> filteredBooks = [];
  List<String> kategoriList = ['Semua', 'Fiksi', 'Ilmu Pengetahuan'];

  @override
  void initState() {
    super.initState();
    allBooks.shuffle(Random());
    searchController.addListener(() {
      filterBooks();
    });
  }

  void filterBooks() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredBooks = allBooks.where((book) {
        final title = book['title']?.toLowerCase() ?? '';
        final author = book['author']?.toLowerCase() ?? '';
        final category = book['category']?.toLowerCase() ?? '';
        final matchText = title.contains(query) || author.contains(query) || category.contains(query);
        final matchKategori = selectedCategory == 'Semua' || book['category'] == selectedCategory;
        return matchText && matchKategori;
      }).toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'PerpusGo',
          style: TextStyle(
            color: Color(0xFF293C82),
            fontFamily: 'fredoka',
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar and category dropdown
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: TextField(
                        controller: searchController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.search),
                          hintText: 'Cari buku...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedCategory,
                          isExpanded: true,
                          icon: const Icon(Icons.arrow_drop_down),
                          items: kategoriList
                              .map((kategori) => DropdownMenuItem(
                                    value: kategori,
                                    child: Text(kategori),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedCategory = value!;
                              filterBooks();
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Quick Access Cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildQuickAccessCard(
                    icon: Icons.menu_book_rounded,
                    title: 'E-Book',
                    onTap: () => Get.toNamed('/e-book'),
                  ),
                  buildQuickAccessCard(
                    icon: Icons.library_books,
                    title: 'Katalog Buku',
                    onTap: () => Get.toNamed('/katalog'),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Buku hasil pencarian atau kategori default
              filteredBooks.isNotEmpty || searchController.text.isNotEmpty
                  ? buildKategori('Hasil Pencarian', filteredBooks)
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: kategoriList
                          .where((kategori) => kategori != 'Semua')
                          .map((kategori) => buildKategori(
                                kategori,
                                allBooks.where((book) => book['category'] == kategori).toList(),
                              ))
                          .toList(),
                    ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/peminjaman'),
        backgroundColor: const Color(0xFF293C82),
        child: const Icon(Icons.library_add, color: Colors.white), // Ikon diganti di sini
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

  Widget buildQuickAccessCard({required IconData icon, required String title, required VoidCallback onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Column(
              children: [
                Icon(icon, size: 36, color: const Color(0xFF293C82)),
                const SizedBox(height: 8),
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildKategori(String title, List<Map<String, String>> books) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'fredoka',
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 240,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final book = books[index];
              return GestureDetector(
                onTap: () => Get.toNamed('/buku', arguments: book),
                child: Container(
                  width: 130,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
                    ],
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          book['image']!,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        book['title'] ?? '',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        book['author'] ?? '',
                        style: const TextStyle(fontSize: 11, color: Colors.grey),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
