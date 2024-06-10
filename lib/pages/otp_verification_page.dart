import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controller/auth_controller.dart';
import '../services/common_service.dart';

class OtpVerification extends GetView<AuthController> {
  OtpVerification({super.key});

  final CommonService commonService = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
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
                key: controller.otpFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      "OTP Verification",
                      style: Get.theme.textTheme.headline5,
                    ),
                    Text(
                      "Enter the 4-digit OTP sent to your phone",
                      style: Get.theme.textTheme.subtitle1?.copyWith(
                        color: const Color.fromRGBO(139, 139, 139, 1),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      style: Get.theme.textTheme.subtitle1,
                      keyboardType: TextInputType.number,
                      maxLength: 4, // Set max length to 4
                      validator: (String? input) {
                        if (input == null || input.isEmpty) {
                          return "Please enter the 4-digit OTP";
                        } else if (input.length != 4) {
                          return "OTP must be 4 digits long";
                        }
                        return null;
                      },
                      onChanged: (input) {
                        // Handle OTP input change
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        hintText: "Enter OTP",
                        filled: true,
                        hintStyle: Get.theme.textTheme.subtitle1?.copyWith(
                          color: const Color.fromRGBO(139, 139, 139, 1),
                        ),
                        fillColor: const Color.fromRGBO(120, 120, 120, 0.12),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 15.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ).pOnly(bottom: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Implement OTP verification functionality here
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(Get.width, 50),
                        backgroundColor: Get.theme.indicatorColor,
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 30,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Verify OTP",
                        style: Get.theme.textTheme.subtitle1
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
                          onTap: () {
                            // Navigate to sign up screen
                          },
                          child: "Don't have an account ?  "
                              .text
                              .textStyle(
                            Get.theme.textTheme.bodyText2!.copyWith(),
                          )
                              .make(),
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed("/sign-up");
                          },
                          child: "Sign Up"
                              .text
                              .textStyle(
                            Get.theme.textTheme.bodyText2!.copyWith(
                              decoration: TextDecoration.underline,
                              color: Colors.lightBlue,
                            ),
                          )
                              .make(),
                        ),
                      ],
                    )
                  ],
                ).pSymmetric(h: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
