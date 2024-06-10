import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mahabharat_museum/services/common_service.dart';

import '../models/config_model.dart';
import '../services/config_service.dart';

class SplashController extends GetxController {
  RxDouble progressValue = 0.0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchLabelData();
    Timer timer = Timer.periodic(const Duration(milliseconds: 20), (timer) {
      if (progressValue.value < 1.0) {
        progressValue.value += 0.01;
      } else {
        timer.cancel(); // Stop the timer when progress reaches 100%
      }
    });
    gotoHome(timer);
  }

  gotoHome(Timer timer) async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAndToNamed("/");
  }

  Future<void> fetchDashboardData() async {
    String file = "dashboard.json";
    if (GetStorage().read('language_id') != '' ||
        GetStorage().read('language_id') != null) {
      switch (GetStorage().read('language_id')) {
        case 1:
          file = "dashboard.json";
          break;
        case 2:
          file = "dashboard_hi.json";
          break;
      }
    }
    try {
      final String data =
          await rootBundle.loadString('assets/data_files/$file');
      var response = jsonDecode(data);
      if (response['status']) {
        // CommonService commonService=  Get.find();
        // commonService.configData.value =
        //       ConfigModel.fromJSON(response);
        //   commonService.dashboardData.value = DashboardModel.fromJSON(response);
        //   commonService.dashboardData.refresh();
        //   commonService.dashboardData.value.data.forEach((e) {
        //     if (e.mType == "markup") {
        //       commonService.customTextAttribute.value = e.attributes[0];
        //       commonService.customTextAttribute.refresh();
        //     }
        //   });
      }
    } catch (e) {
      throw Exception("Error: ${e.toString()}");
    }
  }

  Future<void> fetchLabelData() async {
    String file = "label.json";
    if (GetStorage().read('language_id') != '' ||
        GetStorage().read('language_id') != null) {
      switch (GetStorage().read('language_id')) {
        case 1:
          file = "label.json";
          break;
        case 2:
          file = "label_hi.json";
          break;
      }
    }
    try {
      final String data =
          await rootBundle.loadString('assets/json/$file');
      var response = jsonDecode(data);
      if (response['status']) {
        Get.find<ConfigService>().configData.value =
            ConfigModel.fromJSON(response);
        Get.find<ConfigService>().configData.refresh();
      }
    } catch (e) {
      throw Exception("Error: ${e.toString()}");
    }
  }
}
