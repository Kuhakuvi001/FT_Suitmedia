// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia/configs/config_color.dart';
import 'package:suitmedia/configs/config_image.dart';
import 'package:suitmedia/configs/config_setting.dart';
import 'package:suitmedia/views/login/controller_login.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
            onWillPop: controller.closeAll,
            child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImage.bg),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SafeArea(
                    child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                      child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(children: <Widget>[
                      layoutLogo(),
                      layoutForm("Name", controller.inputname),
                      layoutForm("Palindrome", controller.inputpalindrome),
                      Padding(padding: EdgeInsets.only(bottom: 35)),
                      layoutButton("CHECK", controller.checkPalindrome),
                      layoutButton("NEXT", controller.nextPage)
                    ]),
                  )),
                )))));
  }

  Widget layoutLogo() {
    return Container(
      width: 116,
      height: 116,
      padding: EdgeInsets.only(right: 10),
      margin: EdgeInsets.only(bottom: 66),
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: AppColor.colorblue.withOpacity(0.7)),
      child: Icon(
        Icons.person_add,
        color: AppColor.colorwhite,
        size: 50,
      ),
    );
  }

  Widget layoutForm(texthint, contr) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(bottom: 22),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColor.colorwhite,
            border: Border.all(color: AppColor.colorstroke)),
        child: TextField(
          controller: contr,
          maxLines: 1,
          keyboardType: TextInputType.visiblePassword,
          inputFormatters: [],
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 10, bottom: 10),
            border: InputBorder.none,
            hintText: texthint,
            isDense: true,
            focusedBorder: InputBorder.none,
            hintMaxLines: 1,
            hintStyle: TextStyle(
              fontSize: AppSetting.sizetextnormal + 3,
              color: AppColor.colortexthint,
            ),
          ),
          style: TextStyle(
            letterSpacing: AppSetting.sizeletterspacing,
            fontSize: AppSetting.sizetextnormal + 3,
            color: AppColor.colortext,
          ),
        ));
  }

  Widget layoutButton(value, ontap) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 15),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
                color: AppColor.colorbluev2,
                child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () => ontap(),
                        child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 13),
                            child: Text(
                              value,
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
