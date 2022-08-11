// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia/configs/config_color.dart';
import 'package:suitmedia/configs/config_image.dart';
import 'package:suitmedia/configs/config_setting.dart';
import 'package:suitmedia/models/model_user.dart';
import 'package:suitmedia/views/user/controller_user.dart';

class UserPage extends StatelessWidget {
  final controller = Get.find<UserController>();

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
              "Users",
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
            child: GetBuilder(
              init: controller,
              builder: (_) {
                return ListView.builder(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                    shrinkWrap: true,
                    itemCount: controller.listitem.length,
                    itemBuilder: (_, pos) {
                      return itemBody(controller.listitem[pos]);
                    });
              },
            )));
  }

  Widget itemBody(UserModel dataitem) {
    return InkWell(
        onTap: () {
          controller.selectUser(dataitem);
        },
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: AppColor.colorgray, width: 0.5))),
          child: Row(children: <Widget>[
            ClipOval(
                child: Image.network(
              dataitem.image,
              width: 49,
              height: 49,
            )),
            Padding(padding: EdgeInsets.only(left: 20)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  dataitem.name,
                  style: TextStyle(
                    letterSpacing: AppSetting.sizeletterspacing,
                    fontSize: AppSetting.sizetextnormal + 3,
                    color: AppColor.colortext,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 4)),
                Text(
                  dataitem.email,
                  style: TextStyle(
                    letterSpacing: AppSetting.sizeletterspacing,
                    fontSize: AppSetting.sizetextnormal - 3,
                    color: AppColor.colortextv3,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            )
          ]),
        ));
  }
}
