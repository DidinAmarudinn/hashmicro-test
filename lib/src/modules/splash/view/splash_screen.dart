import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hashmicro_test/src/modules/splash/controller/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SplashView'),
        centerTitle: true,
      ),
      body: GetBuilder<SplashController>(builder: (controller) {
        return const Center(
          child: Text(
            'This is Splashscreen',
            style: TextStyle(fontSize: 20),
          ),
        );
      }),
    );
  }
}
