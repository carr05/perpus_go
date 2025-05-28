import 'package:get/get.dart';
import '../controllers/pengembalian_controller.dart';

class PengembalianBinding extends Bindings {
  @override
  void dependencies() {
    // Pakai put supaya controller di-reset saat masuk halaman
    Get.put(PengembalianController());
  }
}
