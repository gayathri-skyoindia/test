import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mahabharat_museum/utilities/routes_utility.dart';
import 'package:mahabharat_museum/utilities/theme_utility.dart';

Future<void> main() async {
  runApp(const MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..maskType = EasyLoadingMaskType.black
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.blue
    ..textColor = Colors.blue
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mahabharata Museum',
      initialRoute: '/detail',
      theme: ThemeUtility.themeData,
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      getPages: RoutesUtility.pagesList,
    );
  }
}
