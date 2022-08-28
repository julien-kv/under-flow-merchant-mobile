import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:merchant_app/app/common/models/userEventTicket.dart';
import 'package:merchant_app/app/modules/event_detail/repository/event_detail_repository.dart';
import 'package:merchant_app/app/modules/widgets/common/custom_toast.dart';

import '../../../common/models/event.dart';

class EventDetailController extends GetxController {
  late Rx<Event> event = Event.emptyInitialization().obs;
  final RxBool isFromAllEventsPage = false.obs;
  String? contractAddress;
  String? walletAddress;
  final RxBool _isLoading = false.obs;
  set isLoading(bool status) => _isLoading.value = status;
  bool get isLoading => _isLoading.value;

  RxBool hasData = false.obs;
  set isEventsSuccess(bool status) => hasData.value = status;
  bool get isEventsSuccess => hasData.value;
  RxInt ticketQuantity = 0.obs;
  final Rx<UserEventTicket> userEventTicket = UserEventTicket.empty().obs;

  @override
  void onInit() {
    if (Get.arguments["event"] != null) {
      isFromAllEventsPage.value = true;
      event.value = Get.arguments["event"];
    } else {
      if (Get.arguments["scanData"] != null) {
        final code = Get.arguments["scanData"];
        final jsonString = jsonDecode(code);
        if (jsonString != null) {
          contractAddress = jsonString["contractAddress"];
          walletAddress = jsonString["walletAddress"];
          getEventAndTicket();
        }
      }
    }
    super.onInit();
  }

  Future<void> getEventAndTicket() async {
    isLoading = true;

    final Either<String, UserEventTicket> result = await EventDetailrepository
        .instance
        .getEventsAndTicket(contractAddress ?? "", walletAddress ?? "");
    result.fold((exception) {
      isEventsSuccess = false;
    }, (events) {
      userEventTicket.value = events;
      event.value = events.event;
      ticketQuantity.value = events.ticketQuantity;
      // if (eventsList.isNotEmpty) {
      //   eventsList.clear();
      // }
      // eventsList.addAll(events);
      isEventsSuccess = true;
    });
    isLoading = false;

    if (ticketQuantity.value == 0) {
      CustomToast.showErrorToast("Invalid QR Code");
      Get.back();
    }
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
