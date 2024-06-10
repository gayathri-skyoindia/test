import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mahabharat_museum/utilities/my_consts.dart';
import '../apis/auth_apis.dart';

class AuthController extends GetxController {
  final AuthApis _authApi = AuthApis();
  final TextEditingController phoneEmailController = TextEditingController();
  final TextEditingController pinController = TextEditingController();

  final TextEditingController passController = TextEditingController();
  final TextEditingController confPassController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();

  Future<void> createUserAccount() async {
    if (mobileController.text.isEmpty ||
        passController.text.isEmpty ||
        confPassController.text.isEmpty ||
        nameController.text.isEmpty ||
        emailController.text.isEmpty) {
      // Show toast for error
      EasyLoading.showError('All fields are required');
      return;
    }

    try {
      EasyLoading.show(status: 'Loading...');

      var response = await _authApi.createUserAccount(
        mobileNo: mobileController.text,
        password: passController.text,
        email: emailController.text,
        name: nameController.text,
      );

      // For example:
      if (response['status'] == 200) {
        EasyLoading.showSuccess('Success');
        Get.toNamed('/sign-in');
      } else {
        // Registration failed
        // Error message: response['message']
        EasyLoading.showError(response['message']);
      }
    } catch (e) {
      EasyLoading.showError('Error');
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> loginUser() async {
    if (phoneEmailController.text.isEmpty || pinController.text.isEmpty) {
      // Show toast for error
      EasyLoading.showError('All fields are required');
      return;
    }

    try {
      EasyLoading.show(status: 'Loading...');

      var response = await _authApi.loginUser(
        mobileNo: phoneEmailController.text,
        password: pinController.text,
        languageId: 1,
      );
      if (response['status'] == 200) {
        EasyLoading.showSuccess('Success');
        GetStorage().write(MyConsts.loginResponseIdKey, response.toString());
        Get.toNamed('/home');
      } else {
        EasyLoading.showError(response['message']);
      }
    } catch (e) {
      EasyLoading.showError('Error');

      if (kDebugMode) {
        print(e);
      }
    } finally {
      EasyLoading.dismiss();
    }
  }
}
