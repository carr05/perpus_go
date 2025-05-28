import 'package:get/get.dart';
import '../controllers/e_book_controller.dart';

class EbookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EBookController>(() => EBookController());
  }
}
