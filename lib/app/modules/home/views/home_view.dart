import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:merchant_app/app/modules/all_events/views/all_events_view.dart';
import 'package:merchant_app/app/modules/qr_Scan/views/qr_scan_view.dart';
import 'package:merchant_app/app/modules/widgets/common/custom_bottom_navigation_bar.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: Text('HomeView'),
          centerTitle: true,
        ),
        body: IndexedStack(
          index: controller.selectedIndex.value,
          children: [AllEventsView(), QrScanView()],
        ),
        bottomNavigationBar: CustomBottomNavBar(
            index: controller.selectedIndex.value,
            onPressed: controller.onBottomNavBarPressed),
      );
    });
  }
}
