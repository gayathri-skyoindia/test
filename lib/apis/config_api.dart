import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import '../services/common_service.dart';
import '../services/config_service.dart';
import '../utilities/my_consts.dart';
import '../utilities/utility.dart';

class ConfigApi {
  final Dio _dio = Dio();
  CommonService commonService = Get.find();
  ConfigService configService = Get.find();

  Future deleteAccount() async {
    try {
      Uri uri = Uri.parse('${MyConsts.baseUrl}/appconfig/account_delete');

      // Get token from storage
      String token = GetStorage().read('token') ?? '';

      // Define headers
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token,
      };

      // Make DELETE request using Dio
      var response = await _dio.delete(
        uri.toString(),
        options: Options(headers: headers),
      );

      // Print response body
      print(response.data);

      // // Show toast message
      // Fluttertoast.showToast(
      //   msg: configService.configData.value.labelData.value.data.deleteMsg,
      //   backgroundColor: Colors.green,
      //   gravity: ToastGravity.TOP,
      // );

      // Return response data
      return response.data;
    } catch (e) {
      print('Error during deleteAccount: $e');
      throw e;
    }
  }
}
