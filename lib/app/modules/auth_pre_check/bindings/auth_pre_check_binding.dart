import 'package:get/get.dart';

import '../controllers/auth_pre_check_controller.dart';

class AuthPreCheckBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthPreCheckController>(
      () => AuthPreCheckController(),
    );
  }
}
