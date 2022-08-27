import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/widgets/common/custom_inkwell_widget.dart';
import '../../modules/widgets/common/custom_text_button.dart';
import '../../modules/widgets/common/loading_indicator.dart';
import 'exports.dart';

class Utils {
  const Utils._();

  static void showDialog(
    String? message, {
    String title = Strings.error,
    bool success = false,
    VoidCallback? onTap,
  }) =>
      Get.defaultDialog(
        barrierDismissible: false,
        onWillPop: () async {
          Get.back();

          onTap?.call();

          return true;
        },
        title: success ? Strings.success : title,
        content: Text(
          message ?? Strings.somethingWentWrong,
          textAlign: TextAlign.center,
          maxLines: 6,
          style: AppTextStyle.smallSemiBoldStyle.copyWith(
            color: AppColors.mineShaft,
            fontSize: Dimens.fontSize16,
          ),
        ),
        confirm: Align(
          alignment: Alignment.centerRight,
          child: CustomInkwellWidget.text(
            onTap: () {
              Get.back();

              onTap?.call();
            },
            title: Strings.ok,
            textStyle: AppTextStyle.buttonTextStyle.copyWith(
              fontSize: Dimens.fontSize18,
            ),
          ),
        ),
      );

  static void showIconDialog(
    String title,
    String message, {
    Widget? imageWidget,
    VoidCallback? onTap,
  }) =>
      Get.dialog(
        AlertDialog(
          title:
              imageWidget ?? const Icon(Icons.done), //add your icon/image here
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyle.smallSemiBoldStyle.copyWith(
                  color: Colors.black,
                  fontSize: Dimens.fontSize24,
                ),
              ),
              SizedBox(height: 10.w),
              Text(message,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.regularStyle.copyWith(
                    color: AppColors.mineShaft,
                    fontSize: Dimens.fontSize16,
                  )),
              SizedBox(height: 20.w),
              CustomTextButton(
                title: Strings.ok,
                onPressed: () {
                  Get.back();

                  onTap?.call();
                },
              ),
            ],
          ),
        ),
        barrierDismissible: false,
      );

  static void timePicker(
    Function(String time) onSelectTime, {
    TimeOfDay? initialTime,
  }) {
    showTimePicker(
      context: Get.overlayContext!,
      initialTime: initialTime ??
          TimeOfDay.fromDateTime(
            DateTime.now(),
          ),
    ).then((v) {
      if (v != null) {
        final _now = DateTime.now();
        final _dateTime = DateTime(
          _now.year,
          _now.month,
          _now.day,
          v.hour,
          v.minute,
        );

        onSelectTime(_dateTime.formattedDate(dateFormat: 'hh:mm aa'));
      }
    });
  }

  static void loadingDialog() {
    Utils.closeDialog();

    Get.dialog(LoadingIndicator());
  }

  static void closeDialog() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }

  static void closeSnackbar() {
    if (Get.isSnackbarOpen) {
      Get.back();
    }
  }

  static void showSnackbar(String? message) {
    closeSnackbar();

    Get.rawSnackbar(message: message);
  }

  static void closeKeyboard() {
    final currentFocus = Get.focusScope!;
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static void goBackToScreen(String routeName) {
    Get.until(
      (route) => route.settings.name == routeName,
    );
  }
}
