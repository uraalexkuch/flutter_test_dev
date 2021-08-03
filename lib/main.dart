import 'package:flutter/material.dart';
import 'package:flutter_test_dev/Pages/FileDetail.dart';
import 'package:flutter_test_dev/Pages/HomePage.dart';
import 'package:flutter_test_dev/Pages/SplashScreen.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashScreen(),
      initialRoute: '/',
      // передаём маршруты в приложение
      getPages: [
        GetPage(
          name: '/Home',
          page: () => HomePage(),
        ),
        GetPage(name: '/Home/file', page: () => FileDetail()),
      ],
    );
  }
}
