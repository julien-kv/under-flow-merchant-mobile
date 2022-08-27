import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:merchant_app/app/modules/widgets/events/event_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/all_events_controller.dart';

class AllEventsView extends GetView<AllEventsController> {
  @override
  Widget build(BuildContext context) {
    final RefreshController refreshController = RefreshController();
    return Obx(() {
      return Scaffold(
          body: SmartRefresher(
        header: const ClassicHeader(),
        controller: refreshController,
        //enablePullUp: true,
        onRefresh: () async {
          await refreshController.requestRefresh();
          await controller.onRefresh();
          refreshController.refreshToIdle();
        },
        child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            itemBuilder: ((context, index) => EventCard(
                id: controller.eventsList[index].merchantId,
                onTapEvent: controller.onTapEvent,
                backgroundImageUrl: controller.eventsList[index].imageUrl ?? "",
                eventName: controller.eventsList[index].title,
                price: controller.eventsList[index].fiatPrice,
                eventLocation: controller.eventsList[index].location)),
            separatorBuilder: (BuildContext context, int index) =>
                index == controller.eventsList.length - 1
                    ? const SizedBox()
                    : Container(
                        height: 5.h,
                        color: Colors.transparent,
                      ),
            itemCount: controller.eventsList.length),
      ));
    });
  }
}
