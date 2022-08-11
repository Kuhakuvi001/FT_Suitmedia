// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:get/get.dart';

class WebsiteController extends GetxController
    with SingleGetTickerProviderMixin {
  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> closeAll() async {
    Get.delete<WebsiteController>();
    Get.back();

    return false;
  }
}
