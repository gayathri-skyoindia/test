import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:mahabharat_museum/controller/dashboard_controller.dart';
import 'package:mahabharat_museum/pages/widgets/blog_widget.dart';
import 'package:mahabharat_museum/pages/widgets/book_ticket_widget.dart';
import 'package:mahabharat_museum/pages/widgets/exhibit_widget.dart';
import 'package:mahabharat_museum/pages/widgets/play_pause_button.dart';
import 'package:mahabharat_museum/pages/widgets/see_all_bar.dart';
import 'package:mahabharat_museum/pages/widgets/show_widget.dart';
import 'package:mahabharat_museum/services/config_service.dart';
import 'package:mahabharat_museum/utilities/my_consts.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final DashBoardController controller = Get.find();
  final ConfigService configService = Get.find();

  List<String> shows = [
    "lorem ipsum dollar",
    "lorem ipsum dollar",
    "lorem ipsum dollar",
    "lorem ipsum dollar",
    "lorem ipsum dollar"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Stack(children: [
              Container(
                height: Get.height / 2 + 160,
                width: Get.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/home_bg.png"),
                        fit: BoxFit.fill)),
              ),
              Container(
                width: Get.width,
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //Welcome Text
                    Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Text(
                          configService.configData.value.labelData.welcomeTo,
                          style: Get.theme.textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        )),
                    Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Text(
                          configService.configData.value.labelData.appName,
                          style: Get.theme.textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w800, fontSize: 25),
                        )),

                    //Banner Images swiper
                    SizedBox(
                      height: Get.width - 80,
                      width: Get.width,
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              controller.images[index],
                              fit: BoxFit.cover,
                              width: Get.width,
                            ),
                          );
                        },
                        itemCount: controller.images.length,
                        layout: SwiperLayout.STACK,
                        itemWidth: Get.width,
                        itemHeight: Get.width,
                        customLayoutOption:
                            CustomLayoutOption(startIndex: -1, stateCount: 3)
                              ..addRotate([
                                20.0, // You might not need rotation, but adjust as necessary
                                20.0,
                                20.0,
                              ])
                              ..addTranslate([
                                const Offset(0.0,
                                    0.0), // Left item slightly up and to the left
                                const Offset(
                                    0.0, 0.0), // Center item remains centered
                                const Offset(0.0,
                                    0.0), // Right item slightly up and to the right
                              ]),
                        pagination: const SwiperPagination(
                          alignment: Alignment.bottomCenter,
                          builder: DotSwiperPaginationBuilder(
                            color: Colors.grey,
                            activeColor: MyConsts.secondaryColor,
                            size: 8.0,
                            // Dot size
                            activeSize: 12.0, // Active dot size
                          ),
                        ),
                      ),
                    ),

                    //shows Ticket
                    const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          PlayPauseButton(),
                        ]),
                    SeeAllBar(
                      title: "Museum Exhibits",
                      isBlog: false,
                      onTap: () {
                        Get.toNamed('/museum-exhibits');
                      },
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          ...shows.asMap().entries.map((entry) {
                            final index = entry.key;
                            return [
                              ExhibitWidget(
                                  index:
                                      index), // Pass the index to ExhibitWidget
                              const SizedBox(width: 15),
                            ];
                          }).expand((element) => element),
                        ],
                      ),
                    ),
                    const BookTicketWidget(),
                    SeeAllBar(
                      title: "Shows",
                      isBlog: false,
                      onTap: () {
                        Get.toNamed('/all-shows');
                      },
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          ...shows.asMap().entries.map((entry) {
                            final index = entry.key;
                            final element = entry.value;
                            return [
                              ShowWidget(
                                  index:
                                      index), // Pass the index to ExhibitWidget
                              const SizedBox(width: 15),
                            ];
                          }).expand((element) => element),
                        ],
                      ),
                    ),
                    //Blogs
                    Container(
                        margin: const EdgeInsets.fromLTRB(0, 20, 0, 70),
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        color: const Color.fromRGBO(200, 200, 200, 0.4),
                        child: Column(children: [
                          SeeAllBar(
                            title: "Blogs",
                            isBlog: true,
                            onTap: () {
                              Get.toNamed('/all-blogs');
                            },
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                const SizedBox(width: 15),
                                ...shows.asMap().entries.map((entry) {
                                  final index = entry.key;
                                  final element = entry.value;
                                  return [
                                    BlogWidget(
                                        index:
                                            index), // Pass the index to ExhibitWidget
                                    const SizedBox(width: 15),
                                  ];
                                }).expand((element) => element),
                              ],
                            ),
                          )
                        ])),
                  ],
                ),
              ),
            ])));
  }
}
