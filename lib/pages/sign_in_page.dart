import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahabharat_museum/services/config_service.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controller/auth_controller.dart';
import '../services/common_service.dart';

class SignInPage extends GetView<AuthController> {
  SignInPage({super.key});
  CommonService commonService = Get.find();
  ConfigService configService = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Stack(children: [
      Container(
        width: Get.width,
        height: Get.height,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
        child: Image.asset(
          "assets/images/login_signup_top.png",
          fit: BoxFit.fill,
          width: Get.width,
          height: Get.height,
        ),
      ),
      Container(
        width: Get.width,
        height: Get.height * 2 / 3,
        margin: EdgeInsets.fromLTRB(0, Get.height * 1 / 3.5, 0, 0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login_signup_bg.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Form(
          key: controller.loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                "Sign In",
                style: Get.theme.textTheme.headlineLarge,
              ),
              Text(
                "Login to your Account",
                style: Get.theme.textTheme.titleMedium
                    ?.copyWith(color: const Color.fromRGBO(139, 139, 139, 1)),
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                style: Get.theme.textTheme.titleMedium,
                keyboardType: TextInputType.phone,
                validator: (String? input) {
                  if (input == null || input.isEmpty) {
                    return "Phone Number or Email";
                  } else if (input.length != 10) {
                    return "Phone number must be 10 digits long";
                  }
                  return null;
                },
                onChanged: (input) {
                  controller.phoneEmailController.value =
                      TextEditingValue(text: input);
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: "Enter your phone number",
                  filled: true,
                  hintStyle: Get.theme.textTheme.titleMedium
                      ?.copyWith(color: const Color.fromRGBO(139, 139, 139, 1)),
                  fillColor: const Color.fromRGBO(120, 120, 120, 0.12),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ).pOnly(bottom: 20),
              TextFormField(
                style: Get.theme.textTheme.titleMedium,
                keyboardType: TextInputType.number,
                obscureText: true,
                validator: (String? input) {
                  if (input == null || input.isEmpty) {
                    return "Please enter a 4-digit PIN";
                  } else if (input.length != 4) {
                    return "PIN must be 4 digits long";
                  }
                  return null;
                },
                onChanged: (input) {
                  controller.pinController.value =
                      TextEditingValue(text: input);
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: "Enter your 4-digit PIN",
                  filled: true,
                  fillColor: const Color.fromRGBO(120, 120, 120, 0.12),
                  hintStyle: Get.theme.textTheme.titleMedium
                      ?.copyWith(color: const Color.fromRGBO(139, 139, 139, 1)),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ).pOnly(bottom: 20),
              ElevatedButton(
                onPressed: () {
                  controller.loginUser();
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(Get.width, 50),
                  backgroundColor: Get.theme.indicatorColor,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Sign In",
                  style: Get.theme.textTheme.titleMedium
                      ?.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: "Don't have an account ?  "
                        .text
                        .textStyle(Get.theme.textTheme.bodyMedium!.copyWith())
                        .make(),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed("/sign-up");
                    },
                    child: "Sign Up"
                        .text
                        .textStyle(Get.theme.textTheme.bodyMedium!.copyWith(
                          decoration: TextDecoration.underline,
                          color: Colors.lightBlue,
                        ))
                        .make(),
                  )
                ],
              )
            ],
          ).pSymmetric(h: 30),
        ),
      ),
    ])));
  }
}
