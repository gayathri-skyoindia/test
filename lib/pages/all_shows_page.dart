import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahabharat_museum/pages/widgets/all_shows_widget.dart';

class AllShowsPage extends GetView {
  const AllShowsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        centerTitle: true,
        title: Text(
          'All Shows',
          style: Get.theme.textTheme.titleMedium?.copyWith(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: 8, // Total number of labels and GridViews
        itemBuilder: (BuildContext context, int index) {
          // Return a MyGridView for each label
          return MyGridView(label: "Block ${String.fromCharCode(65 + index)}");
        },
      ),
    );
  }
}

class MyGridView extends StatelessWidget {
  final String label;

  const MyGridView({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
          child: Text(
            label,
            style: Get.theme.textTheme.headlineMedium,
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 widgets per row
            mainAxisSpacing: 8.0, // spacing between rows
            crossAxisSpacing: 8.0, // spacing between columns
            childAspectRatio:
                0.7, // aspect ratio of each child (width / height)
          ),
          itemCount: 6, // Total number of items
          itemBuilder: (BuildContext context, int index) {
            // Return AllShowsWidget for each item
            return AllShowsWidget(index: index);
          },
        ),
      ],
    );
  }
}
