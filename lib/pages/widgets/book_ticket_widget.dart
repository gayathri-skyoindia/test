import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahabharat_museum/utilities/my_consts.dart';

class BookTicketWidget extends StatelessWidget {
  const BookTicketWidget({super.key});
  static const Color lightColor = Color.fromRGBO(255, 255, 255, 0.65);
  final grad1 = const Color.fromRGBO(243, 115, 17, 0.41);
  final grad2 = const Color.fromRGBO(141, 67, 10, 0.41);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
      width: Get.width,
      height: 240,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/book_ticket_bg.png"),
              fit: BoxFit.fill)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Entry Pass of',
            style: Get.theme.textTheme.bodySmall?.copyWith(
              color: lightColor,
            ),
          ),
          Text(
            'Mahabharata Museum',
            style: Get.theme.textTheme.headlineMedium
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.w800),
          ),
          Container(
            width: Get.width,
            margin: const EdgeInsets.fromLTRB(0, 40, 0, 10),
            height: 80,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/book_ticket_btn_bg.png"),
                    fit: BoxFit.fill)),
            child: InkWell(
                onTap: () {},
                child: Container(
                    height: 70,
                    margin: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: MyConsts.secondaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Text(
                      "Book Your Ticket",
                      style: Get.theme.textTheme.titleMedium?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w800),
                    ))),
          ),
        ],
      ),
    );
  }
}
