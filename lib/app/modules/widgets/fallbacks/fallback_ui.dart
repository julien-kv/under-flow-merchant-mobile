import 'package:flutter/material.dart';

import '../../../common/values/app_images.dart';
import '../../../common/values/styles/app_text_style.dart';
import '../common/custom_button.dart';

class FallbackUI extends StatelessWidget {
  VoidCallback retryFunction;

  FallbackUI({required this.retryFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.fallbackLogo,
            width: 140,
            height: 130,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "Something went wrong",
            style: AppTextStyle.regularStyle.copyWith(
              fontWeight: FontWeight.w500,
              color: Color(0xFF636363),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          CustomButton(
            buttonText: "Retry",
            buttonWidth: 155,
            onTap: retryFunction,
          ),
        ],
      ),
    );
  }
}
