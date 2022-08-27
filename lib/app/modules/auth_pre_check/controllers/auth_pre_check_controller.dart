import 'package:get/get.dart';
import 'package:merchant_app/app/routes/app_pages.dart';

class AuthPreCheckController extends GetxController {
  RxBool isLoading = true.obs;

  @override
  void onInit() async {
    super.onInit();
    await retryFunction();
  }

  Future<void> retryFunction() async {
    isLoading.value = true;
    Future.delayed(const Duration(milliseconds: 200), () {
      Get.offAllNamed(Routes.HOME);
    });
    isLoading.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
