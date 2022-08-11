// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia/configs/config_color.dart';
import 'package:suitmedia/configs/config_setting.dart';
import 'package:suitmedia/views/home/controller_home.dart';
import 'package:suitmedia/views/website/controller_website.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebsitePage extends StatelessWidget {
  final controller = Get.find<WebsiteController>();
  final cHome = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
            onWillPop: controller.closeAll,
            child: SafeArea(
              child: Column(children: <Widget>[
                layoutTop(),
                layoutBody(),
              ]),
            )));
  }

  Widget layoutTop() {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 20, bottom: 20),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColor.colorgray))),
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 0,
                left: 20,
                child: InkWell(
                    onTap: () {
                      controller.closeAll();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColor.colorbluev2,
                    ))),
            Center(
                child: Text(
              "",
              textAlign: TextAlign.center,
              style: TextStyle(
                letterSpacing: AppSetting.sizeletterspacing,
                fontSize: AppSetting.sizetextnormal + 5,
                color: AppColor.colorbluev2,
                fontWeight: FontWeight.w600,
              ),
            ))
          ],
        ));
  }

  Widget layoutBody() {
    return Expanded(
        child: Container(
      width: double.infinity,
      child: WebView(
        initialUrl: cHome.usermodel?.website,
      ),
    ));
  }
}
