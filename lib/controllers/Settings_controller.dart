import 'package:get/get.dart';

class SettingsController extends GetxController {
  var settings = <String, dynamic>{
    "ThreadCount": 0.obs,
    "MaxRetries": 0.obs,
    "MaxConcurrentDownloads": 0.obs,
    "Categories": <String>[].obs,
    "Extensions": <String>[].obs,
    "OutputDir": ''.obs,
    "categoryInfo": <Map<String, dynamic>>[].obs,
    "CustomHeaders": Rxn<Map<String, String>>(),
    "CustomCookies": Rxn<Map<String, String>>(),
  }.obs;

  void updateSetting(String key, dynamic value) {
    if (settings.containsKey(key)) {
      settings[key] = value;
    } else {
      throw Exception("Setting $key does not exist");
    }
  }
}
