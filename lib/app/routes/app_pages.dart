import 'package:get/get.dart';

import '../modules/all_events/bindings/all_events_binding.dart';
import '../modules/all_events/views/all_events_view.dart';
import '../modules/auth_pre_check/bindings/auth_pre_check_binding.dart';
import '../modules/auth_pre_check/views/auth_pre_check_view.dart';
import '../modules/event_detail/bindings/event_detail_binding.dart';
import '../modules/event_detail/views/event_detail_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/scanner_view/bindings/scanner_view_binding.dart';
import '../modules/scanner_view/views/scanner_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

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
      name: _Paths.SCANNER_VIEW,
      page: () => ScannerViewView(),
      binding: ScannerViewBinding(),
    ),
    GetPage(
      name: _Paths.EVENT_DETAIL,
      page: () => EventDetailView(),
      binding: EventDetailBinding(),
    ),
    GetPage(
      name: _Paths.AUTH_PRE_CHECK,
      page: () => AuthPreCheckView(),
      binding: AuthPreCheckBinding(),
    ),
  ];
}
