import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:merchant_app/app/modules/all_events/controllers/all_events_controller.dart';
import 'package:merchant_app/app/modules/all_events/views/all_events_view.dart';
import 'package:merchant_app/app/modules/scanner_view/controllers/scanner_view_controller.dart';
import 'package:merchant_app/app/modules/scanner_view/views/scanner_view_view.dart';
import 'package:merchant_app/app/modules/widgets/common/custom_bottom_navigation_bar.dart';

import '../../../common/values/strings.dart';
import '../../widgets/appbar/custom_appbar_widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: CustomAppbarWidget(
          title: Strings.appName,
          isBackButton: false,
          centerTitle: true,
        ),
        body: IndexedStack(
          index: controller.selectedIndex.value,
          children: [
            AllEventsView(),
            ScannerViewView(),
          ],
        ),
        bottomNavigationBar: CustomBottomNavBar(
            index: controller.selectedIndex.value,
            onPressed: controller.onBottomNavBarPressed),
      );
    });
  }
}
