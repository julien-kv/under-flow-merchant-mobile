import 'package:flutter/material.dart';
import '../../../common/values/app_colors.dart';

class LoadingIndicator extends StatelessWidget {
  double height;
  Color indicatorColor;
  double strokeWidth;
  double? value;

  LoadingIndicator({
    this.height = 24,
    this.indicatorColor = AppColors.blue,
    this.strokeWidth = 4.0,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: height,
        height: height,
        child: CircularProgressIndicator(
          value: value,
          color: indicatorColor,
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}
