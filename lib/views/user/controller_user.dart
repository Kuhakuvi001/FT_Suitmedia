// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:suitmedia/configs/config_setting.dart';
import 'package:suitmedia/models/model_user.dart';
import 'package:suitmedia/providers/provider_user.dart';
import 'package:suitmedia/views/home/controller_home.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController with SingleGetTickerProviderMixin {
  List<UserModel> listitem = [];

  final cHome = Get.find<HomeController>();

  @override
  void onInit() {
    super.onInit();

    callApi();
  }

  Future<bool> closeAll() async {
    Get.delete<UserController>();
    Get.back();

    return false;
  }

  void selectUser(UserModel dataitem) {
    cHome.usermodel = dataitem;
    cHome.refresh();
    closeAll();
  }

  void callApi() async {
    try {
      http.Response response = await UserProvider().getData();
      var res = jsonDecode(response.body);
      UserModel().convert(res['data'], listitem);
    } catch (e) {
      print(e);
    } finally {
      refresh();
    }
  }
}
