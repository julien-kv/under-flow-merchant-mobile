import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';

import '../../modules/widgets/common/custom_error_widget.dart';
import '../api/interface_controller/network_with_api_interface_controller.dart';
import '../service/network_service.dart';
import '../service/storage_service.dart';

class Initializer {
  static final Initializer instance = Initializer._internal();
  factory Initializer() => instance;
  Initializer._internal();

  void init(VoidCallback runApp) {
    ErrorWidget.builder = (errorDetails) {
      return CustomErrorWidget(
        message: errorDetails.exceptionAsString(),
      );
    };

    runZonedGuarded(() async {
      FlutterError.onError = (details) {
        FlutterError.dumpErrorToConsole(details);
        printInfo(info: details.stack.toString());
      };
      await _initServices();
      runApp();
    }, (error, stack) async {
      printInfo(info: 'runZonedGuarded: ${stack.toString()}');
    });
  }

  Future<void> _initServices() async {
    try {
      _initScreenPreference();
      _initDotEnv();
      _initApis();
      _initFlutterNotification();
      _setDisplayToHighRefreshRate();
      await _initStorage();
    } catch (err) {
      rethrow;
    }
  }

  void _initApis() {
    Get.put<NetworkService>(NetworkService());
    Get.put<NetworkWithApiInterfaceController>(
        NetworkWithApiInterfaceController());
  }

  Future<void> _initStorage() async {
    await GetStorage.init();
    Get.put<StorageService>(StorageService());
  }

  Future<void> _initDotEnv() async {
    await dotenv.load();
  }

  Future<void> _initFlutterNotification() async {
    //init local notification
  }

  Future<void> _localNotification(dynamic message) async {
    //show flutter local notification
  }

  Future<void> onSelectNotification(String? payload) async {
    if (payload != null) {
      dynamic object = const JsonDecoder().convert(payload);
      routeOnSelectNotification(object["path"]);
    }
  }

  void routeOnSelectNotification(String uri) {
    //app routing on notification click
  }

  Future<void> _setDisplayToHighRefreshRate() async {
    if (Platform.isAndroid) {
      try {
        final modes = await FlutterDisplayMode.supported;
        await FlutterDisplayMode.setHighRefreshRate();
      } on PlatformException catch (e) {}
    }
  }

  void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
