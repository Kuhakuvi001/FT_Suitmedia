import 'package:get/get.dart';
import 'package:suitmedia/views/splash/controller_splash.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
