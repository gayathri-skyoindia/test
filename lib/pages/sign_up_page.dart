import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahabharat_museum/services/config_service.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controller/auth_controller.dart';
import '../services/common_service.dart';

class SignUpPage extends GetView<AuthController> {
  SignUpPage({super.key});
  CommonService commonService = Get.find();
  ConfigService configService = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
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
            key: controller.signupFormKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Sign Up",
                    style: Get.theme.textTheme.headlineLarge,
                  ),
                  Text(
                    "Create your new account",
                    style: Get.theme.textTheme.titleMedium?.copyWith(
                        color: const Color.fromRGBO(139, 139, 139, 1)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: Get.theme.textTheme.titleMedium,
                    keyboardType: TextInputType.text,
                    validator: (String? input) {
                      if (input == null || input.isEmpty) {
                        return "Please enter your name";
                      } else if (input.length < 2) {
                        return "Name must be at least 2 characters long";
                      }
                      return null;
                    },
                    onChanged: (input) {
                      controller.nameController.value =
                          TextEditingValue(text: input);
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      hintText: "Enter your name",
                      filled: true,
                      hintStyle: Get.theme.textTheme.titleMedium?.copyWith(
                          color: const Color.fromRGBO(139, 139, 139, 1)),
                      fillColor: const Color.fromRGBO(120, 120, 120, 0.12),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 15.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ).pOnly(bottom: 10),
                  TextFormField(
                    style: Get.theme.textTheme.titleMedium,
                    keyboardType: TextInputType.emailAddress,
                    validator: (String? input) {
                      if (input == null || input.isEmpty) {
                        return "Please enter an email address";
                      } else if (!GetUtils.isEmail(input)) {
                        return "Please enter a valid email address";
                      }
                      return null;
                    },
                    onChanged: (input) {
                      controller.emailController.value =
                          TextEditingValue(text: input);
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      hintText: "Enter your email address",
                      filled: true,
                      hintStyle: Get.theme.textTheme.titleMedium?.copyWith(
                          color: const Color.fromRGBO(139, 139, 139, 1)),
                      fillColor: const Color.fromRGBO(120, 120, 120, 0.12),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 15.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ).pOnly(bottom: 10),
                  TextFormField(
                    style: Get.theme.textTheme.titleMedium,
                    keyboardType: TextInputType.phone,
                    validator: (String? input) {
                      if (input == null || input.isEmpty) {
                        return "Please enter a phone number";
                      } else if (input.length != 10) {
                        return "Phone number must be 10 digits long";
                      }
                      return null;
                    },
                    onChanged: (input) {
                      controller.mobileController.value =
                          TextEditingValue(text: input);
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      hintText: "Enter your phone number",
                      filled: true,
                      hintStyle: Get.theme.textTheme.titleMedium?.copyWith(
                          color: const Color.fromRGBO(139, 139, 139, 1)),
                      fillColor: const Color.fromRGBO(120, 120, 120, 0.12),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 15.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ).pOnly(bottom: 10),
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
                      controller.passController.value =
                          TextEditingValue(text: input);
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      hintText: "Enter your 4-digit PIN",
                      filled: true,
                      hintStyle: Get.theme.textTheme.titleMedium?.copyWith(
                          color: const Color.fromRGBO(139, 139, 139, 1)),
                      fillColor: const Color.fromRGBO(120, 120, 120, 0.12),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 15.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ).pOnly(bottom: 10),
                  TextFormField(
                    style: Get.theme.textTheme.titleMedium,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    validator: (String? input) {
                      if (input == null || input.isEmpty) {
                        return "Please confirm your 4-digit PIN";
                      } else if (input.length != 4) {
                        return "PIN must be 4 digits long";
                      }
                      return null;
                    },
                    onChanged: (input) {
                      controller.confPassController.value =
                          TextEditingValue(text: input);
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      hintText: "Confirm your 4-digit PIN",
                      filled: true,
                      hintStyle: Get.theme.textTheme.titleMedium?.copyWith(
                          color: const Color.fromRGBO(139, 139, 139, 1)),
                      fillColor: const Color.fromRGBO(120, 120, 120, 0.12),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 15.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ).pOnly(bottom: 10),
                  ElevatedButton(
                    onPressed: () {
                      controller.createUserAccount();
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(Get.width, 50),
                      backgroundColor: Get.theme.indicatorColor,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Sign Up",
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
                            .textStyle(
                                Get.theme.textTheme.bodyMedium!.copyWith())
                            .make(),
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed("/sign-in");
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
            )),
      ),
    ]));
  }
}
