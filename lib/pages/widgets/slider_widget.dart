import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/attribute_model.dart';

class SliderWidget extends StatelessWidget {
  final List<Attributes> attributes;

  SliderWidget(this.attributes);

  @override
  Widget build(BuildContext context) {
    var _current = 0.obs;

    return attributes.isNotEmpty
        ? Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: Get.height * 0.30,
                  viewportFraction: 1,
                  initialPage: 0,
                  autoPlay: attributes.length > 1 ? true : false,
                  pageSnapping: attributes.length > 1 ? true : false,
                  autoPlayInterval: Duration(seconds: 3),
                  enableInfiniteScroll: false,
                  reverse: false,
                  onPageChanged: (index, reason) {
                    _current.value = index;
                    _current.refresh();
                  },
                ),
                items: attributes.map((Attributes value) {
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () {
                          AssetsAudioPlayer.allPlayers().forEach((key, value) {
                            value.pause();
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.asset(
                                    "assets/images/bg.png",
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width,
                                    height: Get.height * 0.30,
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: Get.height * 0.30,
                                  color: Colors.black38,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Positioned(
                bottom: 10,
                right: 0,
                left: 0,
                child: Obx(
                  () => Center(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: attributes.map((slide) {
                          return Container(
                            width: 10.0,
                            height: 10.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 3.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                color:
                                    _current.value == attributes.indexOf(slide)
                                        ? Get.theme.colorScheme.primary
                                        : Colors.white),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ).pOnly(bottom: Get.height * 0.025)
        : SizedBox();
  }
}
