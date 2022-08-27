import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';

import '../../../common/values/app_colors.dart';
import '../../../common/values/app_images.dart';
import '../../../common/values/styles/dimens.dart';

class EventCard extends StatelessWidget {
  String id;
  String backgroundImageUrl;
  String eventName;
  String price;
  String eventLocation;

  Function(String) onTapEvent;

  EventCard({
    required this.id,
    required this.onTapEvent,
    required this.backgroundImageUrl,
    required this.eventName,
    required this.price,
    required this.eventLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 15,
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        onTap: () {
          onTapEvent(id);
        },
        child: Card(
          margin: EdgeInsets.zero,
          elevation: 8,
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              OptimizedCacheImage(
                memCacheHeight: 800.h.toInt(),
                memCacheWidth: 800.w.toInt(),
                maxHeightDiskCache: 800.h.toInt(),
                maxWidthDiskCache: 800.w.toInt(),
                imageUrl: backgroundImageUrl,
                imageBuilder: (context, imageProvider) => Ink(
                  width: 345,
                  height: 345,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
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
              Container(
                padding: const EdgeInsets.all(18),
                width: 345,
                height: 345,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black.withOpacity(0.1), Colors.black],
                      stops: const [0.55, 1],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 220,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            eventName,
                            style: TextStyle(
                              fontSize: Dimens.fontSize18,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            price,
                            style: TextStyle(
                              fontSize: Dimens.fontSize14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              eventLocation,
                              style: TextStyle(
                                fontSize: Dimens.fontSize14,
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
