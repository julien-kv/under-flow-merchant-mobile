import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/values/app_colors.dart';
import '../controllers/auth_pre_check_controller.dart';

class AuthPreCheckView extends GetView<AuthPreCheckController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return Container(
              height: Get.height,
              width: Get.width,
              padding: const EdgeInsets.only(
                top: 15,
                bottom: 10,
              ),
              color: AppColors.white,
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
