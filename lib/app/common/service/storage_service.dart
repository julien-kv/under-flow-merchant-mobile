import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  static StorageService box = Get.find();
  GetStorage store = GetStorage();

  // write storage operations here

  Future<void> saveValue(String key, dynamic value) =>
      store.writeIfNull(key, value);

  T? getValue<T>(String key) => store.read<T>(key);

  bool hasData(String key) => store.hasData(key);

  Future<void> removeValue(String key) => store.remove(key);

  Future<void> clearStorage() => store.erase();
}
