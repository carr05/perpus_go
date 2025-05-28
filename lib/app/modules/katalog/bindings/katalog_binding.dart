import 'package:get/get.dart';
import '../controllers/katalog_controller.dart';

class KatalogBukuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KatalogBukuController>(() => KatalogBukuController());
  }
}
