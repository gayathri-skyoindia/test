import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mahabharat_museum/pages/widgets/all_exhibit_widget.dart';

class AllExhibitsPage extends GetView {
  const AllExhibitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          centerTitle: true,
          title: Text(
            'All Exhibits',
            style:
                Get.theme.textTheme.titleMedium?.copyWith(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Create 8 horizontal lists
              for (int i = 0; i < 8; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 10),
                      child: Text(
                        "Block ${String.fromCharCode(65 + i)}",
                        style: Get.theme.textTheme.headlineMedium,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.28, // Adjust height as needed
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            7, // Change this to the number of items in each horizontal list
                        itemBuilder: (context, index) {
                          // Create an AllExhibitWidget for each item
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: AllExhibitWidget(index: index),
                          );
                        },
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ));
  }
}
