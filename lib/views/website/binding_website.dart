import 'package:get/get.dart';
import 'package:suitmedia/views/website/controller_website.dart';

class WebsiteBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(WebsiteController());
  }
}
