import 'package:get/get.dart';
import 'package:suitmedia/views/login/controller_login.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
