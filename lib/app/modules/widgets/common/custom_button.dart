import 'package:flutter/material.dart';
import '../../../common/util/exports.dart';

class CustomButton extends StatelessWidget {
  Color? buttonColor;
  Color? buttonTextColor;
  Color? borderColor;
  VoidCallback? onTap;
  String buttonText;
  double? buttonHeight;
  double buttonWidth;
  double? fontSize;
  FontWeight? fontWeight;

  CustomButton({
    required this.buttonText,
    required this.buttonWidth,
    required this.onTap,
    this.buttonHeight,
    this.buttonColor,
    this.buttonTextColor,
    this.fontSize,
    this.borderColor,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth,
      height: buttonHeight ?? 40.h,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: borderColor ?? AppColors.blue,
          width: onTap != null ? 1 : 0,
        ),
      ),
      child: TextButton(
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            buttonText.split(" ").length,
            (index) => Text(
              buttonText.split(" ")[index] +
                  (index == buttonText.split(" ").length - 1 ? "" : " "),
              style: AppTextStyle.smallSemiBoldStyle.copyWith(
                color: buttonTextColor ?? AppColors.blue,
                fontSize: fontSize ?? 14,
                fontWeight: fontWeight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
