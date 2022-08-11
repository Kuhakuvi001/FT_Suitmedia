// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia/configs/config_color.dart';
import 'package:suitmedia/configs/config_image.dart';
import 'package:suitmedia/views/splash/controller_splash.dart';

class SplashPage extends StatelessWidget {
  final controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: AnimatedBuilder(
                animation: controller.animationController!,
                builder: (_, __) {
                  return FadeTransition(
                      opacity: controller.animationHeader!,
                      child: Transform(
                        transform: Matrix4.translationValues(
                            0.0,
                            30 * (1.0 - controller.animationHeader!.value),
                            0.0),
                        child: Center(
                            child: Container(
                                padding: EdgeInsets.only(bottom: 50),
                                child: Icon(
                                  Icons.logo_dev,
                                  size: 100,
                                  color: AppColor.colorbluev2,
                                ))),
                      ));
                })));
  }
}
