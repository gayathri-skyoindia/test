import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utilities/my_consts.dart';

class SeeAllBar extends StatelessWidget {
  const SeeAllBar(
      {super.key, required this.title, this.onTap, required this.isBlog});
  final String title;
  final bool isBlog;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20, 10, 10, 0),
          child: Text(
            title,
            style: Get.theme.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: MyConsts.primaryColor),
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 10, 5),
            child: Text(
              "See All",
              style: Get.theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 16,
                  // fontWeight: FontWeight.w200,
                  color: MyConsts.secondaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
