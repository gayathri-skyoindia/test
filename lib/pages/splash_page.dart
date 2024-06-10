import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahabharat_museum/controller/splash_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/splash.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            "Welcome\nto the\nMahabharata\nMuseum",
            style: Get.theme.textTheme.headlineLarge?.copyWith(
              color: Colors.white,
              fontSize: 40,
              height: 1.3,
              letterSpacing: 1.1,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.left,
          ),
          const Spacer(),
          Obx(
            () => SizedBox(
                width: Get.width - 100,
                child: LinearProgressIndicator(
                  value: controller.progressValue.value,
                  backgroundColor: const Color.fromRGBO(255, 255, 255, 0.3),
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                )),
          ),
        ],
      ).pSymmetric(h: 20, v: 28),
    );
  }
}
