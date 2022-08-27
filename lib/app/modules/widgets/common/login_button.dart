import 'package:flutter/material.dart';
import '../../../common/util/exports.dart';

class LoginButton extends StatelessWidget {
  String buttonText;
  String assetPath;
  VoidCallback onPressed;

  LoginButton({
    required this.assetPath,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 230,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 0.2,
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              assetPath,
              height: 24,
              width: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Text(
                buttonText,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: Dimens.fontSize16,
                  color: AppColors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
