import 'package:get/get.dart';

import '../modules/all_events/bindings/all_events_binding.dart';
import '../modules/all_events/views/all_events_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/qr_Scan/bindings/qr_scan_binding.dart';
import '../modules/qr_Scan/views/qr_scan_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ALL_EVENTS,
      page: () => AllEventsView(),
      binding: AllEventsBinding(),
    ),
    GetPage(
      name: _Paths.QR_SCAN,
      page: () => QrScanView(),
      binding: QrScanBinding(),
    ),
  ];
}
