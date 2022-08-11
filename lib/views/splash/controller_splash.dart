// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:suitmedia/configs/config_route.dart';

class SplashController extends GetxController
    with SingleGetTickerProviderMixin {
  AnimationController? animationController;
  Animation<double>? animationHeader;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);

    animationHeader = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: animationController!,
            curve: Interval(0, 1, curve: Curves.fastOutSlowIn)));
  }

  @override
  void onReady() async {
    super.onReady();
    await animationController!.forward();
    closeAll();
  }

  Animation<double> getanimation(pos) {
    return Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController!,
        curve: Interval(0.1 * pos, 1, curve: Curves.fastOutSlowIn)));
  }

  Future<bool> closeAll() async {
    await Future.delayed(Duration(seconds: 2));
    animationController?.dispose();

    Get.delete<SplashController>();
    Get.offAllNamed(AppRoute.login);
    return false;
  }
}
