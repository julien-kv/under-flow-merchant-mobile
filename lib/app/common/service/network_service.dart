import 'package:get/get.dart';

import '../api/api_client.dart';
import '../api/api_provider.dart';

class NetworkService extends GetxService {
  static NetworkService networkService = Get.find();
  ApiClient api = ApiClient(apiProvider());
}
