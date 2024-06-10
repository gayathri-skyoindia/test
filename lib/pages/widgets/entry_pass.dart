import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EntryPass extends StatelessWidget {
  const EntryPass({super.key});
  static const Color lightColor = Color.fromRGBO(255, 255, 255, 0.65);
  final grad1 = const Color.fromRGBO(243, 115, 17, 0.41);
  final grad2 = const Color.fromRGBO(141, 67, 10, 0.41);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
      width: Get.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/entry_pass_bg.png"),
              fit: BoxFit.fill)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Entry Pass',
            style: Get.theme.textTheme.bodySmall?.copyWith(
              color: lightColor,
            ),
          ),
          Text(
            'Mahabharata Museum',
            style: Get.theme.textTheme.titleMedium
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.w800),
          ),
          Container(
            width: Get.width,
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
            height: 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [grad1, grad2],
              ),
            ),
          ),
          Text(
            'Date',
            style: Get.theme.textTheme.bodySmall?.copyWith(
              color: lightColor,
            ),
          ),
          Text(
            '15 AUGUST 6:00 PM',
            style: Get.theme.textTheme.titleMedium
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.w800),
          ),
          Container(
            width: Get.width,
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
            height: 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [grad1, grad2],
              ),
            ),
          ),
          Text(
            'Address',
            style: Get.theme.textTheme.bodySmall?.copyWith(
              color: lightColor,
            ),
          ),
          Text(
            'Kurukshetra (Haryana)',
            style: Get.theme.textTheme.titleMedium
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.w800),
          ),
          Container(
            width: Get.width,
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 40),
            height: 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [grad1, grad2],
              ),
            ),
          ),
          Text(
            'Entry Pass',
            style: Get.theme.textTheme.bodySmall?.copyWith(
              color: lightColor,
            ),
          ),
          Text(
            'Mahabharata Museum',
            style: Get.theme.textTheme.titleMedium
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.w800),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Image(
                  width: 100,
                  height: 50,
                  fit: BoxFit.contain,
                  image: AssetImage(
                      'assets/images/qr_code.png')), // Use your QR code image
              // const SizedBox(width: 10),
              Text(
                '15 AUGUST 6:00 PM',
                style: Get.theme.textTheme.titleMedium?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
