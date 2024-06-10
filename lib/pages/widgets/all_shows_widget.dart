import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahabharat_museum/utilities/my_consts.dart';
class AllShowsWidget extends StatelessWidget {
  const AllShowsWidget({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {},
        child: Stack(
          children: [
            Container(
                height: Get.height * 0.35,
                width: Get.width * 0.45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.grey.withOpacity(0.5), // Set the shadow color
                      spreadRadius: 2, // Set the spread radius of the shadow
                      blurRadius: 5, // Set the blur radius of the shadow
                      offset:
                          const Offset(0, 3), // Set the offset of the shadow
                    ),
                  ],
                ),
                margin: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                // padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: Get.height * 0.15,
                        width: Get.width * 0.45,
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: Colors.black,
                          image: DecorationImage(
                            image: AssetImage(index % 2 == 0
                                ? "assets/images/s1.png"
                                : "assets/images/s2.png"),
                            fit: BoxFit.fill,
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                        child: Text("Lorem ipsum dolor is simply a text",
                            overflow: TextOverflow.clip,
                            maxLines: 2,
                            style: Get.textTheme.titleSmall)),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text("Sat, 30 March",
                            overflow: TextOverflow.clip,
                            maxLines: 2,
                            style: Get.textTheme.bodyMedium)),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: Get.width * 0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              20), // Adjust the radius as needed
                          color: MyConsts.secondaryColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.5), // Set the shadow color
                              spreadRadius:
                                  2, // Set the spread radius of the shadow
                              blurRadius:
                                  5, // Set the blur radius of the shadow
                              offset: const Offset(
                                  0, 3), // Set the offset of the shadow
                            ),
                          ],
                          // Example background color
                        ),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 8), // Adjust padding as needed
                        child: const Center(
                          child: Text(
                            "Book Tickets",
                            style: TextStyle(
                              color: Colors.white, // Text color
                              fontSize: 14, // Text size
                              // Text weight
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Container(
                width: 60,
                height: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(20), // Adjust the radius as needed
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.grey.withOpacity(0.5), // Set the shadow color
                      spreadRadius: 2, // Set the spread radius of the shadow
                      blurRadius: 5, // Set the blur radius of the shadow
                      offset:
                          const Offset(0, 3), // Set the offset of the shadow
                    ),
                  ],
                  // Example background color
                ),
                margin: EdgeInsets.fromLTRB(30, Get.height * 0.15, 0, 0),
                child: Text(
                  "₹100",
                  style: Get.theme.textTheme.titleSmall
                      ?.copyWith(color: MyConsts.secondaryColor),
                )),
          ],
        ));
  }
}
