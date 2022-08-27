import 'package:get/get.dart';

import '../../../common/models/event.dart';

class EventDetailController extends GetxController {
  late Rx<Event> event = Event.emptyInitialization().obs;
  final RxBool isFromAllEventsPage = false.obs;

  @override
  void onInit() {
    if (Get.arguments != null) {
      isFromAllEventsPage.value = true;
      event.value = Get.arguments["event"];
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void onTapBack() {
    Get.back();
  }
}
