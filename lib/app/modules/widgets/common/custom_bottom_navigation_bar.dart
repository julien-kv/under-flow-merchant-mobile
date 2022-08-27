import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/util/exports.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int index;
  final ValueSetter<int> onPressed;
  const CustomBottomNavBar({
    Key? key,
    required this.index,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BottomNavigationBar(
            selectedLabelStyle: TextStyle(
              fontSize: Dimens.fontSize10,
              fontWeight: FontWeight.w600,
              color: AppColors.steelBlue,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: Dimens.fontSize10,
              fontWeight: FontWeight.w600,
              color: AppColors.darkGrey,
            ),
            showUnselectedLabels: true,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: SvgPicture.asset(
                    AppImages.eventIcon,
                    color: AppColors.darkGrey,
                    width: 25,
                    height: 21,
                  ),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: SvgPicture.asset(
                    AppImages.eventIcon,
                    color: AppColors.steelBlue,
                    width: 25,
                    height: 21,
                  ),
                ),
                label: 'Events',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: SvgPicture.asset(
                    AppImages.qr,
                    color: AppColors.darkGrey,
                    width: 25,
                    height: 21,
                  ),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: SvgPicture.asset(
                    AppImages.qr,
                    color: AppColors.steelBlue,
                    width: 25,
                    height: 21,
                  ),
                ),
                label: 'Scan',
              ),
            ],
            currentIndex: index,
            selectedItemColor: AppColors.steelBlue,
            unselectedItemColor: AppColors.darkGrey,
            onTap: (itemIndex) {
              onPressed(itemIndex);
            },
            type: BottomNavigationBarType.fixed),
        AnimatedPositioned(
          left: 1.sw * (0.18 + index * .50),
          duration: const Duration(milliseconds: 200),
          child: Container(
            // margin: const EdgeInsets.only(top: 0),
            width: 1.sw * 0.125,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: AppColors.steelBlue,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
