import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/config_model.dart';

class LanguageSelectionButton extends StatefulWidget {
  final LangModelItems item;
  final VoidCallback? onTap;

  const LanguageSelectionButton({super.key, required this.item, this.onTap});

  @override
  LanguageSelectionButtonState createState() => LanguageSelectionButtonState();
}

class LanguageSelectionButtonState extends State<LanguageSelectionButton> {
  static const Color buttonBorder = Color.fromRGBO(194, 194, 194, 1);
  static const Color buttonBg = Color.fromRGBO(248, 249, 251, 1);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Execute the onTap callback if provided
        widget.onTap?.call();

        // Update the state to trigger a rebuild
        setState(() {});
      },
      child: Container(
        width: Get.width * 0.35,
        height: 38,
        alignment: Alignment.center,
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        padding: const EdgeInsets.fromLTRB(20, 0, 8, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: buttonBorder),
          color: GetStorage().read("language_id") != widget.item.id
              ? buttonBg
              : Get.theme.colorScheme.primary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.item.title.text
                .textStyle(
                  Get.textTheme.displaySmall!.copyWith(
                    color: GetStorage().read("language_id") != widget.item.id
                        ? Get.theme.indicatorColor
                        : Get.theme.highlightColor,
                  ),
                )
                .make()
                .centered(),
            (GetStorage().read("language_id") == widget.item.id)
                ? const Icon(
                    Icons.check_circle,
                    color: Colors.white,
                    size: 25,
                  )
                : Container(
                    decoration: BoxDecoration(
                      color: buttonBg,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: buttonBorder),
                    ),
                    width: 25,
                    height: 25,
                  ),
          ],
        ),
      ).centered().pOnly(bottom: 20),
    );
  }
}
