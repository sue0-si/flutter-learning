import 'package:flutter/material.dart';
import 'package:flutter_learning/01_02_2024/data/model/image_item.dart';

import 'widget/image_item_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  hintText: 'Search Image',
                  suffixIcon:
                      IconButton(onPressed: () {}, icon: Icon(Icons.search))),
            ),
            const SizedBox(
              height: 32,
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 32,
                    mainAxisSpacing: 32,
                  ),
                  itemBuilder: (context, index) {
                    return ImageItemWidget(imageItem: ImageItem(imageUrl: 'https://cdn.pixabay.com/photo/2023/10/20/19/25/moon-8330104_1280.png', tags: 'moon'),);
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}