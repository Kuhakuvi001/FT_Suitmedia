// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:suitmedia/configs/config_setting.dart';
import 'package:suitmedia/models/model_user.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  String name = "";
  UserModel? usermodel;

  @override
  void onInit() {
    super.onInit();

    checkdata();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<bool> closeAll() async {
    Get.delete<HomeController>();
    SystemNavigator.pop();

    return true;
  }

  void checkdata() {
    final prefs = GetStorage();

    name = prefs.read("name") ?? "";
  }
}
