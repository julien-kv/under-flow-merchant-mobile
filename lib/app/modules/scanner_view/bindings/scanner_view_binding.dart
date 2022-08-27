import 'package:get/get.dart';

import '../controllers/scanner_view_controller.dart';

class ScannerViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScannerViewController>(
      () => ScannerViewController(),
    );
  }
}
