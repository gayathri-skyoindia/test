import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mahabharat_museum/pages/widgets/language_selection_button.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/config_model.dart';
import '../services/common_service.dart';
import '../services/config_service.dart';

class LanguageSelection extends GetView {
  static const Color buttonBorder = Color.fromRGBO(194, 194, 194, 1);
  static const Color buttonBg = Color.fromRGBO(248, 249, 251, 1);
  LanguageSelection({super.key});
  final CommonService commonService = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("Mahabharata Museum"),),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Obx(() => Container(
              margin: const EdgeInsets.fromLTRB(0, 70, 0, 0),
              width: Get.width,
              height: Get.height,
              child:
                  // SingleChildScrollView(
                  //   child:
                  Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  "Select Your Language"
                      .text
                      .center
                      .textStyle(Get.textTheme.displayMedium!.copyWith(
                          color: Get.theme.indicatorColor, fontSize: 18))
                      .make()
                      .centered()
                      .pOnly(bottom: 4),
                  "अपनी भाषा का चयन करें"
                      .text
                      .center
                      .textStyle(Get.textTheme.displayMedium!.copyWith(
                          color: Get.theme.indicatorColor, fontSize: 18))
                      .make()
                      .centered()
                      .pOnly(bottom: 16),
                  const SizedBox(
                    height: 30,
                  ),
                  Get.find<ConfigService>().configData.value.langData.isNotEmpty
                      ? Obx(
                          () => ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: (Get.find<ConfigService>()
                                        .configData
                                        .value
                                        .langData
                                        .length /
                                    2)
                                .ceil(),
                            itemBuilder: (context, index) {
                              final int firstIndex = index * 2;
                              final int secondIndex = firstIndex + 1;
                              final firstItem = Get.find<ConfigService>()
                                  .configData
                                  .value
                                  .langData[firstIndex];
                              LangModelItems? secondItem = secondIndex <
                                      Get.find<ConfigService>()
                                          .configData
                                          .value
                                          .langData
                                          .length
                                  ? Get.find<ConfigService>()
                                      .configData
                                      .value
                                      .langData[secondIndex]
                                  : null;

                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  LanguageSelectionButton(
                                    item: firstItem,
                                    onTap: () {
                                      GetStorage()
                                          .write("language_id", firstItem.id);
                                    },
                                  ),
                                  if (secondItem != null)
                                    LanguageSelectionButton(
                                      item: secondItem,
                                      onTap: () {
                                        GetStorage().write(
                                            "language_id", secondItem.id);
                                      },
                                    ),
                                ],
                              );
                            },
                          ),
                        )
                      : const SizedBox(),
                ],
              ).pOnly(
                left: 20,
                right: 20,
                bottom: 30,
              ),
              // )
            )),
      ),
    ));
  }
}
