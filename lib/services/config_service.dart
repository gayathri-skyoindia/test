import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/config_model.dart';

class ConfigService extends GetxService {
  var configData = ConfigModel().obs;
  var fontSize = 1.0.obs;
  var selectedBottomNav = 2.obs;
  var themeMode = ThemeMode.light.obs;
  var firstTimeLoadApp = true.obs;
  var isInternetOn = false.obs;

}
