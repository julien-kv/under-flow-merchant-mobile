import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/util/exports.dart';

class CustomAppbarWidget extends PreferredSize {
  final int view;
  final String title;
  final bool isBackButton;
  final Color? backgroundColor, iconButtonColor;
  final TextStyle? textStyle;
  final List<Map<String, dynamic>>? actions;
  final bool? centerTitle;
  Function(int)? changeView;
  Function()? onTapBackButton;
  Function()? onTapTitle;

  CustomAppbarWidget({
    Key? key,
    required this.title,
    required this.isBackButton,
    this.view = 0,
    this.changeView,
    this.backgroundColor = AppColors.kPrimaryColor,
    this.iconButtonColor = AppColors.black,
    this.textStyle,
    this.actions,
    this.centerTitle,
    this.onTapBackButton,
    this.onTapTitle,
  }) : super(
          key: key,
          child: const SizedBox.shrink(),
          preferredSize: const Size.fromHeight(kToolbarHeight),
        );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      centerTitle: centerTitle ?? Platform.isIOS,
      actions: null,
      leading: isBackButton
          ? IconButton(
              icon: Icon(
                CupertinoIcons.back,
                color: iconButtonColor,
              ),
              onPressed: onTapBackButton,
            )
          : null,
      backgroundColor: backgroundColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (onTapTitle != null)
            InkWell(
              onTap: onTapTitle,
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textStyle ??
                    AppTextStyle.boldStyle.copyWith(
                      fontSize: Dimens.fontSize18,
                    ),
              ),
            )
          else
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textStyle ??
                  AppTextStyle.boldStyle.copyWith(
                    fontSize: Dimens.fontSize18,
                  ),
            ),
          if (changeView != null)
            Container(
              height: 27,
              width: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xFFF3F3F3),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedPositioned(
                    left: view == 0 ? 3 : 27,
                    top: 3,
                    bottom: 3,
                    right: view == 0 ? 27 : 3,
                    duration: const Duration(milliseconds: 200),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.blue,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 2,
                      ),
                      InkWell(
                        onTap: () {
                          changeView!(0);
                        },
                        child: SizedBox(
                          height: 24,
                          width: 24,
                          child: Icon(
                            Icons.grid_view_rounded,
                            color: view == 0
                                ? AppColors.white
                                : const Color(0xFF828282),
                            size: 16,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          changeView!(1);
                        },
                        child: SizedBox(
                          height: 24,
                          width: 24,
                          child: Icon(
                            Icons.menu_rounded,
                            color: view == 1
                                ? AppColors.white
                                : const Color(0xFF828282),
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
