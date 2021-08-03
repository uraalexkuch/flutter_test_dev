import 'dart:core';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test_dev/Controllers/SplashController.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

SplashController controller = SplashController();

// Создаём состояние виджета
class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  // Инициализация состояния
  @override
  void initState() {
    super.initState();
    // Создаём таймер, который должен будет переключить SplashScreen на HomeScreen через 2 секунды
    Timer(Duration(seconds: 7),
        // Для этого используется статический метод навигатора
        // Это очень похоже на передачу лямбда функции в качестве аргумента std::function в C++
        () {
      Get.toNamed(
        '/Home',
      );
    });
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeOutSine);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Формирование виджета
  @override
  Widget build(BuildContext context) {
    // А вот это вёрстка виджета,
    // немного похоже на QML хотя явно не JSON структура

    return SafeArea(
        left: true,
        top: true,
        right: true,
        bottom: true,
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Scaffold(
              body: Center(
                  child: Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('image/sand.gif'),
                        fit: BoxFit.fitHeight)),
                child: FadeTransition(
                  opacity: _animation,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        " Think about Eternity ...\n Save the data ..",
                        style: TextStyle(
                            color: Colors.amber,
                            fontFamily: "Church",
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )),
            )));
  }
}
