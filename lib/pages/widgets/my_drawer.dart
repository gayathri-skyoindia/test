import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mahabharat_museum/utilities/my_consts.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/config_model.dart';
import '../../services/config_service.dart';

class MyDrawer extends GetView {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
            child: Column(children: [
          GestureDetector(
            child: Container(
              decoration: const BoxDecoration(color: MyConsts.leftPanelUserBg),
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
              child: Row(
                children: [
                  SvgPicture.asset("assets/images/svg/user.svg"),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    Get.find<ConfigService>()
                        .configData
                        .value
                        .labelData
                        .guestUser,
                    style: Get.theme.textTheme.titleMedium!
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: Get.find<ConfigService>()
                    .configData
                    .value
                    .mainMenuData
                    .length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  MainMenuItems item = Get.find<ConfigService>()
                      .configData
                      .value
                      .mainMenuData
                      .elementAt(index);
                  return ListTile(
                    onTap: () async {
                      Get.back();

                      if (item.alias == "home") {
                        if (Get.currentRoute != "/dashboard") {
                          AssetsAudioPlayer.allPlayers().forEach((key, value) {
                            value.pause();
                          });
                          Get.toNamed('/dashboard');
                        }
                      } else if (item.alias == "language") {
                        AssetsAudioPlayer.allPlayers().forEach((key, value) {
                          value.pause();
                        });
                        Get.toNamed('/select-language');
                      } else if (item.alias == "font-size") {
                        AssetsAudioPlayer.allPlayers().forEach((key, value) {
                          value.pause();
                        });
                        // Get.toNamed('/fonts');
                      } else if (item.alias == "help") {
                        AssetsAudioPlayer.allPlayers().forEach((key, value) {
                          value.pause();
                        });
                        launchUrlString(
                            "tel://${Get.find<ConfigService>().configData.value.helpDesk}");
                      }
                    },
                    dense: true,
                    leading: SvgPicture.asset(
                      item.icon,
                      // color: colorConst,
                      width: 20,
                      height: 20,
                      // color: Get.theme.indicatorColor,
                    ),
                    title: item.title.text
                        .textStyle(Get.textTheme.bodyMedium!)
                        .make(),
                  );
                }),
          )
        ])));
  }
}
