import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mahabharat_museum/pages/widgets/all_blogs_widget.dart';
import 'package:mahabharat_museum/utilities/my_consts.dart'; // Import your ExhibitWidget

class AllBlogsPage extends StatelessWidget {
  AllBlogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          centerTitle: true,
          title: Text(
            'All Blogs',
            style:
                Get.theme.textTheme.titleMedium?.copyWith(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Banner Image
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: 150, // Adjust height as needed
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/b1.png'), // Your banner image asset
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.all(10),
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                              child: Text("Lorem ipsum dolor",
                                  style: Get.textTheme.titleSmall!
                                      .copyWith(color: MyConsts.myWhite))),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text("Sat, 30 March",
                                  overflow: TextOverflow.clip,
                                  maxLines: 2,
                                  style: Get.textTheme.bodyMedium!
                                      .copyWith(color: MyConsts.myWhite))),
                        ],
                      ))
                ],
              ),
              // Row with two columns
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // First column
                    Expanded(
                      child: Column(
                        children:
                            _buildExhibitWidgets(), // Generate widgets for the first column
                      ),
                    ),
                    const SizedBox(width: 10), // Spacer between columns
                    // Second column
                    Expanded(
                      child: Column(
                        children:
                            _buildExhibitWidgets(), // Generate widgets for the second column
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  // Function to generate ExhibitWidget dynamically
  int secondCall = 0;
  List<Widget> _buildExhibitWidgets() {
    List<Widget> widgets = [];
    // Generate a list of ExhibitWidget dynamically (Replace with your data)
    for (int i = 0; i < 6; i++) {
      widgets.add(AllBlogsWidget(
          index: i + secondCall)); // Add ExhibitWidget to the list
    }
    secondCall++;
    return widgets;
  }
}
