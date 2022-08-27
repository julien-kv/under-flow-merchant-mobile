import 'dart:io';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import '../../../common/util/exports.dart';

class CustomToast {
  CustomToast._();
  static void showInfoToast(String message) {
    showToast(
      message,
      duration: const Duration(seconds: 5),
      position: ToastPosition.bottom,
      backgroundColor: AppColors.blue,
      textPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      margin: EdgeInsets.fromLTRB(
        50,
        50,
        50,
        Platform.isIOS ? kBottomNavigationBarHeight + 25 : 50,
      ),
    );
  }

  static void showErrorToast(String message) {
    showToast(
      message,
      duration: const Duration(seconds: 5),
      position: ToastPosition.bottom,
      backgroundColor: Colors.red[600],
      textPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      margin: EdgeInsets.fromLTRB(
        50,
        50,
        50,
        Platform.isIOS ? kBottomNavigationBarHeight + 25 : 50,
      ),
    );
  }

  static void showDefaultToast(String message) {
    showToast(
      message,
      duration: const Duration(seconds: 3),
      position: ToastPosition.bottom,
      backgroundColor: Colors.grey[700],
      textPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      margin: EdgeInsets.fromLTRB(
        50,
        50,
        50,
        Platform.isIOS ? kBottomNavigationBarHeight + 25 : 50,
      ),
    );
  }
}
