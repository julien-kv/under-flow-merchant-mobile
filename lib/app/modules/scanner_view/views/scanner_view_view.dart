import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:merchant_app/app/modules/scanner_view/views/qr_scanner.dart';

import '../controllers/scanner_view_controller.dart';

class ScannerViewView extends GetView<ScannerViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: QRScannerWidget()),
    );
  }
}
