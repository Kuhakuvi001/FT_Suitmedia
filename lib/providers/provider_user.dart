// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:suitmedia/configs/config_setting.dart';

class UserProvider extends GetConnect {
  Future getData() {
    var url = AppSetting.urlapi + "profileuser";
    return http
        .get(Uri.parse(url))
        .timeout(Duration(seconds: AppSetting.timeout));
  }
}
