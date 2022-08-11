import 'package:get/get.dart';
import 'package:suitmedia/views/home/controller_home.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
