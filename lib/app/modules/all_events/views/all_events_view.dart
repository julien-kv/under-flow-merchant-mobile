import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/all_events_controller.dart';

class AllEventsView extends GetView<AllEventsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'AllEventsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
