import 'package:get/get.dart';
import 'package:suitmedia/views/user/controller_user.dart';

class UserBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
  }
}
