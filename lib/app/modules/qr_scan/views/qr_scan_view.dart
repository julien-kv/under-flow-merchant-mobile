import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/qr_scan_controller.dart';

class QrScanView extends GetView<QrScanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'QrScanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
