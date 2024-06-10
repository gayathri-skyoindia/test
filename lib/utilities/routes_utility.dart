import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:mahabharat_museum/pages/all_blogs_page.dart';
import 'package:mahabharat_museum/pages/detail_page.dart';
import '../controller/auth_controller.dart';
import '../controller/dashboard_controller.dart';
import '../controller/splash_controller.dart';
import '../pages/all_exhibits_page.dart';
import '../pages/all_shows_page.dart';
import '../pages/home_tab_page.dart';
import '../pages/language_selection_page.dart';
import '../pages/sign_in_page.dart';
import '../pages/sign_up_page.dart';
import '../pages/splash_page.dart';
import '../services/common_service.dart';
import '../services/config_service.dart';

class RoutesUtility {
  static List<GetPage<dynamic>> pagesList = [
    GetPage(name: '/splash', page: () => const SplashPage(), bindings: [
      BindingsBuilder(() {
        Get.lazyPut(() => SplashController());
        Get.lazyPut(() => ConfigService());
        Get.lazyPut(() => CommonService());
      })
    ]),
    GetPage(
        name: '/select-language',
        page: () => LanguageSelection(),
        bindings: [BindingsBuilder(() {})]),
    GetPage(name: '/sign-in', page: () => SignInPage(), bindings: [
      BindingsBuilder(() {
        Get.lazyPut(() => AuthController());
        Get.lazyPut(() => ConfigService());
        Get.lazyPut(() => CommonService());
      })
    ]),
    GetPage(name: '/sign-up', page: () => SignUpPage(), bindings: [
      BindingsBuilder(() {
        Get.lazyPut(() => AuthController());
        Get.lazyPut(() => ConfigService());
        Get.lazyPut(() => CommonService());
      })
    ]),
    GetPage(
        name: '/museum-exhibits',
        page: () => const AllExhibitsPage(),
        bindings: [
          BindingsBuilder(() {
            Get.lazyPut(() => AuthController());
            Get.lazyPut(() => ConfigService());
            Get.lazyPut(() => CommonService());
          }),
        ]),
    GetPage(name: '/all-shows', page: () => const AllShowsPage(), bindings: [
      BindingsBuilder(() {
        Get.lazyPut(() => AuthController());
        Get.lazyPut(() => ConfigService());
        Get.lazyPut(() => CommonService());
      }),
    ]),
    GetPage(name: '/all-blogs', page: () => AllBlogsPage(), bindings: [
      BindingsBuilder(() {
        Get.lazyPut(() => AuthController());
        Get.lazyPut(() => ConfigService());
        Get.lazyPut(() => CommonService());
      }),
    ]),
    GetPage(name: '/', page: () => HomeTabPage(), bindings: [
      BindingsBuilder(() {
        Get.lazyPut(() => DashBoardController());
        Get.lazyPut(() => ConfigService());
        Get.lazyPut(() => CommonService());
      })
    ]),
    GetPage(name: '/detail', page: () => DetailPage(), bindings: [
      BindingsBuilder(() {
        Get.lazyPut(() => DashBoardController());
        Get.lazyPut(() => ConfigService());
        Get.lazyPut(() => CommonService());
      })
    ])
  ];
}
