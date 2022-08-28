import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_app/app/common/util/exports.dart';

import '../../../common/values/styles/dimens.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  const IconAndText({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: AppColors.steelBlue,
              size: 28,
            ),
            SizedBox(
              width: 10.h,
            ),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: Dimens.fontSize16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
