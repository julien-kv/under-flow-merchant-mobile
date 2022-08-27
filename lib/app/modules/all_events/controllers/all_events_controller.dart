import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:merchant_app/app/common/models/events.dart';
import 'package:merchant_app/app/modules/all_events/repository/all_events_repository.dart';

class AllEventsController extends GetxController {
  final RxBool _isLoading = false.obs;
  set isLoading(bool status) => _isLoading.value = status;
  bool get isLoading => _isLoading.value;

  RxBool hasData = false.obs;
  set isEventsSuccess(bool status) => hasData.value = status;
  bool get isEventsSuccess => hasData.value;

  final RxList<Event> _eventsList = <Event>[].obs;
  RxList<Event> get eventsList => _eventsList;
  set eventsList(RxList<Event> events) {
    _eventsList.addAll(events);
  }

  @override
  void onInit() async {
    super.onInit();
    await getEvents();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> getEvents() async {
    isLoading = true;
    final Either<String, List<Event>> result =
        await AllEventsRepository.instance.getEvents();
    result.fold((exception) {
      isEventsSuccess = false;
    }, (events) {
      eventsList.clear();
      eventsList.addAll(events);
      isEventsSuccess = true;
    });
  }

  Future<void> onRefresh() async {
    await getEvents();
  }

  void onTapEvent(String id) {
    // Get.toNamed(
    //   Routes.PROFILE,
    //   arguments: {
    //     "empId": id,
    //     "profileViewedSource": ProfileViewedSource.EMPLOYEE_LIST
    //   },
    // );
  }
}
