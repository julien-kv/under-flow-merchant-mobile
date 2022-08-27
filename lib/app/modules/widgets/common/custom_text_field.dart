import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../common/values/app_colors.dart';
import '../../../common/values/styles/app_text_style.dart';
import '../../../common/values/styles/dimens.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController? textEditingController;
  bool? isReadOnly;
  FocusNode? focusNode;
  Widget? suffixIcon;
  String hintText;
  String? initialValue;
  bool? isNumber = false;
  int? maxLines;
  bool isEnabled = true;
  Function(String)? onChanged;
  TextCapitalization textCapitalization;
  int? maxLength;
  double? height;
  double? width;
  bool isBold;
  String? prefixText;
  Color? fontColor;
  double? fontSize;
  FontWeight? fontWeight;
  VoidCallback? onTapTextField;
  Color? customEnabledColor;

  CustomTextField({
    this.textEditingController,
    this.focusNode,
    this.suffixIcon,
    this.initialValue,
    this.isNumber,
    this.maxLength,
    this.isEnabled = true,
    this.isBold = false,
    required this.hintText,
    this.maxLines,
    this.onChanged,
    this.height,
    this.width,
    this.prefixText,
    this.fontColor,
    this.fontSize,
    this.fontWeight,
    this.isReadOnly,
    this.onTapTextField,
    this.customEnabledColor,
    this.textCapitalization = TextCapitalization.sentences,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 355,
      height: height ?? 40,
      child: TextFormField(
        textCapitalization: textCapitalization,
        onTap: onTapTextField,
        readOnly: isReadOnly ?? false,
        controller: textEditingController,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: isBold ? FontWeight.w500 : fontWeight,
          color: fontColor,
        ),
        focusNode: focusNode,
        maxLines: maxLines ?? 1,
        enabled: isEnabled,
        inputFormatters: isNumber == true
            ? [
                LengthLimitingTextInputFormatter(10),
                FilteringTextInputFormatter.digitsOnly,
              ]
            : [LengthLimitingTextInputFormatter(maxLength)],
        keyboardType:
            isNumber == true ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            top: maxLines == 1 ? 10 : 20,
            left: 10,
          ),
          prefix: Text(
            prefixText ?? '',
            style: AppTextStyle.regularStyle.copyWith(
              color: fontColor,
              fontSize: Dimens.fontSize14,
            ),
          ),
          suffixIcon: suffixIcon,
          suffixIconConstraints: const BoxConstraints(
            maxHeight: 50,
            maxWidth: 50,
          ),
          hintText: hintText,
          hintStyle: AppTextStyle.regularStyle.copyWith(
            fontSize: 12,
            color: isEnabled
                ? const Color(0xFF7D7D7D)
                : const Color(0xFF7D7D7D).withOpacity(0.5),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
            borderSide: BorderSide(
              color: const Color(0xFF202020).withOpacity(0.1),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
            borderSide: BorderSide(
              color: customEnabledColor ??
                  const Color(0xFF202020).withOpacity(0.3),
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
            borderSide: BorderSide(
              color: customEnabledColor ??
                  const Color(0xFF202020).withOpacity(0.3),
              width: 1,
            ),
          ),
          fillColor: customEnabledColor ?? AppColors.white,
        ),
        initialValue: initialValue,
        onChanged: onChanged,
      ),
    );
  }
}
