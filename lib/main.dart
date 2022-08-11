import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:suitmedia/configs/config_color.dart';
import 'package:suitmedia/configs/config_font.dart';
import 'package:suitmedia/configs/config_route.dart';
import 'package:suitmedia/views/home/binding_home.dart';
import 'package:suitmedia/views/home/page_home.dart';
import 'package:suitmedia/views/login/binding_login.dart';
import 'package:suitmedia/views/login/page_login.dart';
import 'package:suitmedia/views/splash/binding_splash.dart';
import 'package:suitmedia/views/splash/page_splash.dart';
import 'package:suitmedia/views/user/binding_user.dart';
import 'package:suitmedia/views/user/page_user.dart';
import 'package:suitmedia/views/website/binding_website.dart';
import 'package:suitmedia/views/website/page_website.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: AppFont.fontregular,
      ),
      initialRoute: AppRoute.splash,
      getPages: [
        GetPage(
          name: AppRoute.splash,
          page: () => SplashPage(),
          binding: SplashBinding(),
        ),
        GetPage(
          name: AppRoute.login,
          page: () => LoginPage(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: AppRoute.home,
          page: () => HomePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: AppRoute.user,
          page: () => UserPage(),
          binding: UserBinding(),
        ),
        GetPage(
          name: AppRoute.website,
          page: () => WebsitePage(),
          binding: WebsiteBinding(),
        ),
      ],
    );
  }
}
