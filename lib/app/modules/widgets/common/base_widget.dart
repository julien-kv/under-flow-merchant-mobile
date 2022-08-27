import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../common/api/interface_controller/network_with_api_interface_controller.dart';
import 'custom_retry_widget.dart';
import '../fallbacks/no_network.dart';
export '../../../common/util/exports.dart';

class BaseWidget extends GetView<NetworkWithApiInterfaceController> {
  ///A widget with only custom retry button widget.
  final Widget child;

  const BaseWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Obx(
        () => Stack(
          children: [
            Positioned.fill(
              child: child,
            ),
            Visibility(
              visible: controller.retry != null && controller.error != null,
              child: Positioned.fill(
                child: Scaffold(
                  body: CustomRetryWidget(
                    onPressed: () {
                      controller.error = null;
                      controller.retry?.call();
                    },
                  ),
                ),
              ),
            ),
            Visibility(
              visible: controller.connectivity == ConnectivityResult.none,
              child: Positioned.fill(
                child: Scaffold(
                  body: SafeArea(
                    child: NetworkConnectivityError(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
