import 'package:flutter/material.dart';

import '../../../common/values/app_colors.dart';
import '../../../common/values/app_images.dart';
import '../../../common/values/styles/app_text_style.dart';

class NetworkConnectivityError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              AppImages.noNetworkLogo,
              color: AppColors.blue.withOpacity(0.8),
            ),
          ),
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "OOPS!",
                  style: AppTextStyle.regularStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF636363),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Couldn't connect to internet.\n Please check your network settings",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.regularStyle.copyWith(
                    fontSize: 14,
                    color: const Color(0xFF636363),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
