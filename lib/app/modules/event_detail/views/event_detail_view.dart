import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';

import '../../../common/values/app_colors.dart';
import '../../../common/values/app_images.dart';
import '../../../common/values/styles/dimens.dart';
import '../controllers/event_detail_controller.dart';
import 'icon_text.dart';

class EventDetailView extends GetView<EventDetailController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black38,
          ),
          extendBodyBehindAppBar: true,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OptimizedCacheImage(
                memCacheHeight: 800.h.toInt(),
                memCacheWidth: 800.w.toInt(),
                maxHeightDiskCache: 800.h.toInt(),
                maxWidthDiskCache: 800.w.toInt(),
                imageUrl: controller.event.value.imageUrl ?? "",
                imageBuilder: (context, imageProvider) => Ink(
                  width: Get.width,
                  height: 400.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) {
                  OptimizedCacheImage.evictFromCache(url);
                  return Ink(
                    width: 345,
                    height: 345,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: ResizeImage(
                          AssetImage(
                            AppImages.placeholderImage,
                          ),
                          height: 345,
                          width: 345,
                        ),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      controller.event.value.title,
                      style: TextStyle(
                          fontSize: Dimens.fontSize22,
                          fontWeight: FontWeight.w900,
                          color: Color(0xff222222)),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    IconAndText(
                      icon: Icons.calendar_month_outlined,
                      text: controller.event.value.datetime,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    IconAndText(
                      icon: Icons.location_on_outlined,
                      text: controller.event.value.location,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Divider(
                      thickness: 2,
                      color: const Color(0xFF989898).withOpacity(0.1),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    if (!controller.isFromAllEventsPage.value)
                      BookingDetails(
                        noOfTickets: 3,
                        walletAddress: "3FZbgi29cpjq2GjdwV8eyHuJJnkLtktZc5",
                      ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class BookingDetails extends StatelessWidget {
  final String walletAddress;
  final int noOfTickets;
  const BookingDetails({
    Key? key,
    required this.walletAddress,
    required this.noOfTickets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Booking Details",
          style: TextStyle(
              fontSize: Dimens.fontSize22,
              fontWeight: FontWeight.w900,
              color: Color(0xff222222)),
        ),
        SizedBox(
          height: 10.h,
        ),
        IconAndText(
          icon: Icons.wallet_outlined,
          text: walletAddress,
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            SvgPicture.asset(
              AppImages.bitcoin,
              width: 28,
              height: 28,
              color: AppColors.steelBlue,
            ),
            SizedBox(
              width: 10.h,
            ),
            Text(
              "x $noOfTickets",
              style: TextStyle(
                fontSize: Dimens.fontSize16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        )
      ],
    );
  }
}
