// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:suitmedia/configs/config_route.dart';

class LoginController extends GetxController with SingleGetTickerProviderMixin {
  TextEditingController inputname = TextEditingController();
  TextEditingController inputpalindrome = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> closeAll() async {
    Get.delete<LoginController>();
    Get.back();

    return false;
  }

  void checkPalindrome() {
    Get.focusScope?.unfocus();
    var textpalindrome = inputpalindrome.text.trim().replaceAll(" ", "");
    if (textpalindrome.isNotEmpty) {
      var reverse = textpalindrome.split('').reversed.join('');
      var msg = "Its A Not Palindrome";
      if (textpalindrome == reverse) {
        msg = "Its A Palindrome";
      }
      Get.defaultDialog(title: "Check", middleText: msg);
    }
  }

  void nextPage() {
    Get.focusScope?.unfocus();
    var textname = inputname.text.trim();
    if (textname.isNotEmpty) {
      final prefs = GetStorage();
      prefs.write("name", textname);
      Get.offAllNamed(AppRoute.home);
    }
  }
}
