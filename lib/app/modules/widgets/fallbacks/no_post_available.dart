import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/app_colors.dart';
import '../../../common/values/app_images.dart';
import '../../../common/values/styles/app_text_style.dart';
import '../../../common/values/styles/dimens.dart';
import '../common/custom_button.dart';

class NoPostsAvailable extends StatelessWidget {
  NoPostsAvailable({Key? key, this.addAPost, this.goBack}) : super(key: key);
  VoidCallback? addAPost;
  VoidCallback? goBack;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: constraints.maxHeight,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.noPostAvaialableV2,
              width: 120,
              color: AppColors.keyvalueBlue.withOpacity(0.8),
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              "No Events",
              style: AppTextStyle.regularStyle.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: Dimens.fontSize15,
                color: const Color(0xFF636363),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      );
    });
  }
}
