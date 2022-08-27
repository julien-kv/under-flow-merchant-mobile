import 'dart:async';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInterfaceController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  Future<void> onInit() async {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    connectivity = await _connectivity.checkConnectivity();
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectivityResult.value = result;
    update();
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
  }

  Rx<ConnectivityResult> _connectivityResult =
      Rx<ConnectivityResult>(ConnectivityResult.none);
  ConnectivityResult get connectivity => _connectivityResult.value;
  set connectivity(ConnectivityResult value) =>
      this._connectivityResult.value = value;
}
