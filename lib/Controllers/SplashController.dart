import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:flutter_test_dev/Pages/SplashScreen.dart';
import 'package:flutter_test_dev/Services/LocalDepository.dart';
import 'package:flutter_test_dev/services/FilesDepository.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  List files = [].obs;
  List titul = [].obs;
  RxBool isLoading = true.obs;
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void onInit() {
    Timer(Duration(seconds: 7),
        // Для этого используется статический метод навигатора
        // Это очень похоже на передачу лямбда функции в качестве аргумента std::function в C++
        () {
      Get.toNamed(
        '/Home',
      );
    });
    //  _controller = //AnimationController(
    //duration: const Duration(seconds: 5),
    //vsync: this,
    // )..repeat(reverse: true);
    ///  _animation =
    ///      CurvedAnimation(parent: _controller, curve: Curves.easeOutSine);
    super.onInit();
  }

  void fetchData() async {
    try {
      files = (await FilesRepository.getAllFiles());
    } finally {
      isLoading.value = false;
    }
    // print(files[0].thumbnailUrl);
  }

  void fetchLocal() async {
    try {
      titul = (await LocalRepository.getAllLocal());
    } finally {
      isLoading.value = false;
    }
    print(titul[0].value);
  }
}
