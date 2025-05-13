
import 'package:get/get.dart';
import 'dart:async';
import 'package:perpus_go/app/routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  @override
void onInit() {
  super.onInit();
  startDelay();
}

void startDelay() {
  Timer(Duration(seconds: 2), () {
    Get.toNamed(Routes.WELCOME);
  });
}


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
