import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utilities/my_consts.dart';

class BlogWidget extends StatelessWidget {
  const BlogWidget({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {},
      child: Container(
        alignment: Alignment.bottomCenter,
        height: Get.height * 0.27,
        width: Get.width * 0.5,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(index % 2 == 0
                ? "assets/images/b1.png"
                : "assets/images/b2.png"),
            fit: BoxFit.fill,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        margin: const EdgeInsets.fromLTRB(10, 0, 0, 10),
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 15),
          height: 50,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.6),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Art of Self Portrait",
                style: Get.theme.textTheme.bodyMedium?.copyWith(
                    color: MyConsts.primaryColor, fontWeight: FontWeight.w600),
              ), // Add some space between the text widgets
              Text(
                "lorem ipsum is simply",
                style: Get.theme.textTheme.bodySmall
                    ?.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
