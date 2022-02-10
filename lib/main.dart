import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:test2/screens/wrapper_menu/wrapper_menu.dart';

import 'screens/auth/auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent, // status bar color
        statusBarIconBrightness: Brightness.dark, // status bar icons' color
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    return GetMaterialApp(
      title: 'test2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "MR",
      ),
      initialRoute: Auth.namePage,
      getPages: [
        GetPage(
          name: Auth.namePage,
          page: () => const Auth(),
        ),
        GetPage(
          name: WrapperMenu.namePage,
          page: () => const WrapperMenu(),
        ),
      ],
    );
  }
}
