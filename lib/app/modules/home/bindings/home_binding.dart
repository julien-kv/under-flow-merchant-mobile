import 'package:get/get.dart';
import 'package:merchant_app/app/modules/all_events/controllers/all_events_controller.dart';
import 'package:merchant_app/app/modules/scanner_view/controllers/scanner_view_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.put(AllEventsController());
    Get.put(ScannerViewController());
  }
}
