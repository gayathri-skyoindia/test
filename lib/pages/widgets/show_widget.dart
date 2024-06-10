import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahabharat_museum/utilities/my_consts.dart';

class ShowWidget extends StatelessWidget {
  const ShowWidget({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {},
        child: Container(
            height: Get.height * 0.325,
            width: Get.width * 0.5,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(240, 240, 240, 1),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Set the shadow color
                  spreadRadius: 2, // Set the spread radius of the shadow
                  blurRadius: 5, // Set the blur radius of the shadow
                  offset: const Offset(0, 3), // Set the offset of the shadow
                ),
              ],
            ),
            margin: const EdgeInsets.fromLTRB(10, 0, 0, 10),
            // padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  height: Get.height * 0.20,
                  width: Get.width * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage(index % 2 == 0
                          ? "assets/images/s1.png"
                          : "assets/images/s2.png"),
                      fit: BoxFit.fill,
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                  child: Text("Lorem ipsum dolor",
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                      style: Get.textTheme.titleSmall)),
              Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text("Sat, 30 March",
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                      style: Get.textTheme.bodyMedium)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.fromLTRB(
                              20, 0, 20, 0), // Set the padding here
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            MyConsts.primaryColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                5.0), // Set the border radius here
                          ),
                        ),
                      ),
                      child: Text(
                        "Book Tickets",
                        style: Get.theme.textTheme.bodyMedium?.copyWith(
                            color: const Color.fromRGBO(240, 240, 240, 1)),
                      )),
                  Text(
                    "₹100",
                    style: Get.theme.textTheme.titleSmall
                        ?.copyWith(color: MyConsts.secondaryColor),
                  )
                ],
              )
            ])));
  }
}
