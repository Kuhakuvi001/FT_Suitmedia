// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia/configs/config_color.dart';
import 'package:suitmedia/configs/config_image.dart';
import 'package:suitmedia/configs/config_route.dart';
import 'package:suitmedia/configs/config_setting.dart';
import 'package:suitmedia/views/home/controller_home.dart';

class HomePage extends StatelessWidget {
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: <Widget>[
        layoutTop(),
        layoutBody(),
      ]),
    ));
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
              "Home",
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
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Welcome",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: AppSetting.sizeletterspacing,
                    fontSize: AppSetting.sizetextnormal,
                    color: AppColor.colortext,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 5)),
                Text(
                  controller.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: AppSetting.sizeletterspacing,
                    fontSize: AppSetting.sizetextnormal + 5,
                    color: AppColor.colortext,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 50)),
                Expanded(
                    child: SingleChildScrollView(
                        child: Container(
                            width: double.infinity,
                            child: GetBuilder(
                              init: controller,
                              builder: (_) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.only(top: 35)),
                                    (controller.usermodel == null)
                                        ? Column(
                                            children: <Widget>[
                                              ClipOval(
                                                  child: Image.asset(
                                                AppImage.user,
                                                width: 164,
                                                height: 164,
                                              )),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 35)),
                                              Text(
                                                  "Select a user to show the profile",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    letterSpacing: AppSetting
                                                        .sizeletterspacing,
                                                    fontSize: AppSetting
                                                            .sizetextnormal +
                                                        5,
                                                    color: AppColor.colortextv2,
                                                    fontWeight: FontWeight.w500,
                                                  ))
                                            ],
                                          )
                                        : Column(
                                            children: <Widget>[
                                              ClipOval(
                                                  child: Image.network(
                                                controller.usermodel!.image,
                                                width: 164,
                                                height: 164,
                                                fit: BoxFit.contain,
                                              )),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 35)),
                                              Text(controller.usermodel!.name,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    letterSpacing: AppSetting
                                                        .sizeletterspacing,
                                                    fontSize: AppSetting
                                                            .sizetextnormal +
                                                        11,
                                                    color: AppColor.colortextv4,
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 8)),
                                              Text(controller.usermodel!.email,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    letterSpacing: AppSetting
                                                        .sizeletterspacing,
                                                    fontSize: AppSetting
                                                            .sizetextnormal +
                                                        5,
                                                    color: AppColor.colortextv4,
                                                    fontWeight: FontWeight.w500,
                                                  )),
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 8)),
                                              InkWell(
                                                  onTap: () {
                                                    Get.toNamed(
                                                        AppRoute.website);
                                                  },
                                                  child: Text("website",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        letterSpacing: AppSetting
                                                            .sizeletterspacing,
                                                        fontSize: AppSetting
                                                                .sizetextnormal +
                                                            5,
                                                        color: AppColor
                                                            .colorbluev2,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                      )))
                                            ],
                                          )
                                  ],
                                );
                              },
                            )))),
                layoutButton()
              ],
            )));
  }

  Widget layoutButton() {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 32),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
                color: AppColor.colorbluev2,
                child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () => {Get.toNamed(AppRoute.user)},
                        child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 13),
                            child: Text(
                              "Choose a User",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                letterSpacing: AppSetting.sizeletterspacing,
                                fontSize: AppSetting.sizetextnormal + 1,
                                color: AppColor.colorwhite,
                                fontWeight: FontWeight.w500,
                              ),
                            )))))));
  }
}
