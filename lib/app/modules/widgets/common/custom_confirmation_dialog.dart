import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/util/exports.dart';

class CustomConfirmationDialog {
  CustomConfirmationDialog._();

  static Future<void> defaultConfirmationDialog({
    required String titleText,
    required String middleText,
    bool barrierDismissible = false,
    required Function confirmFunction,
    required Function cancelFunction,
    String confirmButtonLabel = "Confirm",
    String cancelButtonLabel = "Cancel",
  }) async {
    await Get.defaultDialog(
      titlePadding: const EdgeInsets.only(
        top: 20.0,
      ),
      title: titleText,
      middleText: middleText,
      barrierDismissible: false,
      confirm: Ink(
        width: 1.sw * 0.3,
        child: TextButton(
          onPressed: () {
            confirmFunction();
          },
          child: Text(
            confirmButtonLabel,
            style: const TextStyle(
              color: AppColors.blue,
            ),
          ),
        ),
      ),
      cancel: Ink(
        width: 1.sw * 0.3,
        child: TextButton(
          onPressed: () {
            cancelFunction();
          },
          child: Text(
            cancelButtonLabel,
            style: const TextStyle(
              color: AppColors.red,
            ),
          ),
        ),
      ),
    );
  }
}
