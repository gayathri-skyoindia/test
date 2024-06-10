import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mahabharat_museum/pages/widgets/slider_widget.dart';
import 'package:readmore/readmore.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controller/detail_controller.dart';
import '../models/detail_model.dart';
import '../services/common_service.dart';
import '../services/config_service.dart';

class DetailPage extends GetView<DetailController> {
  DetailPage({super.key});
  final GlobalKey<ScaffoldState> scaffoldDashboardKey =
      GlobalKey<ScaffoldState>();
  final CommonService commonService = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: scaffoldDashboardKey,
      appBar: _buildAppBar(),
      body: _buildBody(),
    ));
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
        preferredSize: Size.fromHeight(Get.height * .08),
        child: AppBar(
          centerTitle: true,
          title: Image.asset(
            height: 45,
            'assets/images/logo2.png',
            fit: BoxFit.fitWidth,
          ),
        ));
  }

  Widget _buildBody() {
    return Obx(() {
      if (commonService.locationDetailData.isEmpty) {
        return const Center(child: Text('No data available'));
      }
      return WillPopScope(
          onWillPop: () async {
            try {
              // AssetsAudioPlayer.allPlayers().forEach((key, value) {
              //   value.pause();
              // });
              navigator?.pop();
              return Future.value(true);
            } catch (e) {
              print('Error on back press: $e');
              return Future.value(true);
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: commonService.locationDetailData
                  .map(_buildDetailWidget)
                  .toList(),
            ),
          ));
    });
  }

  Widget _buildDetailWidget(DetailModel dItem) {
    switch (dItem.moduleAlias) {
      case "loc_description":
        return _buildLocationDescription(dItem);
      default:
        return const SizedBox();
    }
  }

  Widget _buildLocationDescription(DetailModel dItem) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            SliderWidget(dItem.attributes.elementAt(0).imageSliders),
            Positioned(
              right: 30,
              top: 10,
              child: InkWell(
                onTap: () {
                  // Helper.shareExperience(dItem.attributes.elementAt(0));
                },
                child: Container(
                    width: 30,
                    height: 30,
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Get.theme.highlightColor,
                    ),
                    child: SvgPicture.asset(
                      'assets/images/share.svg',
                      height: 20,
                      width: 20,
                      color: Get.theme.indicatorColor,
                    )),
              ),
            )
          ],
        ),
        dItem.attributes
            .elementAt(0)
            .title
            .text
            .textStyle(
              Get.textTheme.displayMedium!.copyWith(
                fontWeight: FontWeight.w500,
                color: Get.theme.colorScheme.primary,
              ),
            )
            .make()
            .pSymmetric(h: 20),
        const SizedBox(
          height: 10,
        ),
        dItem.attributes.elementAt(0).description.isNotEmpty
            ? ReadMoreText(
                dItem.attributes.elementAt(0).description,
                trimLines: 4,
                colorClickableText: Get.theme.colorScheme.primary,
                trimMode: TrimMode.Line,
                style: TextStyle(color: Get.theme.indicatorColor, fontSize: 16),
                trimCollapsedText:
                    Get.find<ConfigService>().configData.value.labelData.more,
                trimExpandedText:
                    Get.find<ConfigService>().configData.value.labelData.less,
                moreStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Get.theme.colorScheme.primary),
              ).pSymmetric(h: 20)
            : const SizedBox(
                height: 0,
              ),
        const SizedBox(
          height: 20,
        ),
        // dItem.attributes.elementAt(0).shortAudio.isNotEmpty

      ],
    ).pOnly(bottom: 5);
  }
}
