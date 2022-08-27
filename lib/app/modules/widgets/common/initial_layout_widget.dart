import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InitialLayoutWidget extends StatelessWidget {
  const InitialLayoutWidget({
    required this.builder,
    this.designSize = const Size(375, 896),
    this.splitScreenMode = false,
    this.minTextAdapt = false,
    Key? key,
  }) : super(key: key);

  final Widget Function() builder;
  final bool splitScreenMode;
  final bool minTextAdapt;
  final Size designSize;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData(size: Get.size == Size.zero ? designSize : Get.size),
      child: LayoutBuilder(builder: (_, BoxConstraints constraints) {
        if (constraints.maxWidth != 0) {
          ScreenUtil.init(_,
              designSize: Get.size,
              splitScreenMode: splitScreenMode,
              minTextAdapt: minTextAdapt);
          return builder();
        }
        return Container();
      }),
    );
  }
}
