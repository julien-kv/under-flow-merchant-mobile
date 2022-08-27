import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/util/exports.dart';

class BottomSheetConfirmationDialog extends StatelessWidget {
  final double? height;
  final Color? buttonColor;
  final String? heading;
  final String? topText;
  final String? lottieFile;
  final List<String>? topRichText;
  final String? bottomText;
  final String? leftButtonLabel;
  final String? rightButtonLabel;
  final Function? leftButtonFunction;
  final Function? rightButtonFunction;
  const BottomSheetConfirmationDialog({
    Key? key,
    this.topText,
    this.heading,
    this.buttonColor,
    this.bottomText,
    this.topRichText,
    this.leftButtonLabel,
    this.rightButtonLabel,
    this.leftButtonFunction,
    this.rightButtonFunction,
    this.height,
    this.lottieFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        width: Get.width,
        height: height ?? ((heading != null) ? 1.sh * 0.36 : 1.sh * 0.30),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: 127.w,
                height: 20.h,
                child: const Divider(
                  thickness: 4,
                ),
              ),
            ),
            if (heading != null)
              Column(
                children: [
                  Center(
                    child: Text(
                      heading!.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: Dimens.fontSize16,
                        color: const Color(0xFF4F4F4F),
                      ),
                    ),
                  ),
                  if (lottieFile != null)
                    Container()
                  else
                    Center(
                      child: SizedBox(
                        width: 1.sw - 25.w,
                        height: 35.h,
                        child: const Divider(
                          thickness: 1,
                        ),
                      ),
                    ),
                ],
              ),
            Padding(
              padding: EdgeInsets.only(
                left: 24.w,
                right: 24.w,
                bottom: 25.h,
                top: bottomText != null ? 5.h : 10.h,
              ),
              child: SizedBox(
                child: Column(
                  children: [
                    if (topText != null)
                      SizedBox(
                        child: Text(
                          topText!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: Dimens.fontSize14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF4F4F4F),
                          ),
                        ),
                      )
                    else
                      SizedBox(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: topRichText?[0] ?? '',
                            style: TextStyle(
                              fontSize: Dimens.fontSize14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF4F4F4F),
                              fontFamily: 'Manrope',
                            ),
                            children: [
                              TextSpan(
                                text: topRichText?[1] ?? '',
                                style: TextStyle(
                                  fontSize: Dimens.fontSize14,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF4F4F4F),
                                  fontFamily: 'Manrope',
                                ),
                                children: [
                                  TextSpan(
                                    text: topRichText!.length > 2
                                        ? topRichText![2]
                                        : '',
                                    style: TextStyle(
                                      fontSize: Dimens.fontSize14,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF4F4F4F),
                                      fontFamily: 'Manrope',
                                    ),
                                  ),
                                  TextSpan(
                                    text: topRichText!.length > 3
                                        ? topRichText![3]
                                        : '',
                                    style: TextStyle(
                                      fontSize: Dimens.fontSize14,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF4F4F4F),
                                      fontFamily: 'Manrope',
                                    ),
                                  ),
                                  TextSpan(
                                    text: topRichText!.length > 4
                                        ? topRichText![4]
                                        : '',
                                    style: TextStyle(
                                      fontSize: Dimens.fontSize14,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF4F4F4F),
                                      fontFamily: 'Manrope',
                                    ),
                                  ),
                                  TextSpan(
                                    text: topRichText!.length > 5
                                        ? topRichText![5]
                                        : '',
                                    style: TextStyle(
                                      fontSize: Dimens.fontSize14,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF4F4F4F),
                                      fontFamily: 'Manrope',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (bottomText != null)
                      Container(
                        padding: EdgeInsets.only(
                          top: 20.h,
                        ),
                        child: Text(
                          bottomText!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: Dimens.fontSize14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF4F4F4F),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            dialogBottomNavBar(),
          ],
        ),
      ),
    );
  }

  Ink dialogBottomNavBar() {
    return Ink(
      height: 50.h,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
      ),
      child: Row(
        mainAxisAlignment: leftButtonLabel != null &&
                leftButtonFunction != null &&
                rightButtonLabel != null &&
                rightButtonFunction != null
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          if (leftButtonLabel != null && leftButtonFunction != null)
            SizedBox(
              width: 140.w,
              height: 40.h,
              child: TextButton(
                style: TextButton.styleFrom(
                  side: BorderSide(
                    color: buttonColor ?? AppColors.blue,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  leftButtonFunction!();
                },
                child: Text(
                  leftButtonLabel!,
                  style: TextStyle(
                    color: buttonColor ?? AppColors.blue,
                    fontWeight: FontWeight.w600,
                    fontSize: Dimens.fontSize14,
                  ),
                ),
              ),
            ),
          if (rightButtonLabel != null && rightButtonFunction != null)
            SizedBox(
              width: 140.w,
              height: 40.h,
              child: ElevatedButton(
                onPressed: () {
                  rightButtonFunction!();
                },
                style: ElevatedButton.styleFrom(
                  primary: buttonColor ?? AppColors.blue,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                  ),
                ),
                child: Text(
                  rightButtonLabel!,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: Dimens.fontSize14,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
