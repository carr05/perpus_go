import 'package:get/get.dart';

class PengembalianController extends GetxController {
  var books = <Map<String, dynamic>>[].obs;

  void tambahDataBuku(Map<String, dynamic> data) {
    books.add(data);
  }
}
