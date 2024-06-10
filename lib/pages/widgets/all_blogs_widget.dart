import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBlogsWidget extends StatelessWidget {
  final int index;
  const AllBlogsWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {},
        child: Container(
            height: index % 2 == 0 ? Get.height * 0.3 : Get.height * 0.23,
            width: Get.width * 0.5,
            margin: const EdgeInsets.fromLTRB(10, 0, 0, 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  height:
                      index % 2 == 0 ? Get.height * 0.23 : Get.height * 0.16,
                  width: Get.width * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage(index % 2 == 0
                          ? "assets/images/m1.png"
                          : "assets/images/m2.png"),
                      fit: BoxFit.fill,
                    ),
                  )),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Lorem ipsum dolor",
                            overflow: TextOverflow.clip,
                            maxLines: 2,
                            style: Get.textTheme.titleSmall),
                        Text("Sat, 30 March",
                            overflow: TextOverflow.clip,
                            maxLines: 2,
                            style: Get.textTheme.bodyMedium),
                      ],
                    ),
                    const Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Image(
                          image: AssetImage('assets/images/chevron_left.png'),
                          width: 20,
                          height: 20,
                        ))
                  ])
            ])));
  }
}
