import 'package:get/get.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  final selectedIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void onBottomNavBarPressed(int index) {
    selectedIndex.value = index;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
