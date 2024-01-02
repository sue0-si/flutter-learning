import 'package:flutter/material.dart';
import 'package:flutter_learning/01_02_2024/data/model/image_item.dart';
import 'package:flutter_learning/01_02_2024/data/repository/image_repository.dart';

import 'widget/image_item_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final searchController = TextEditingController();
  final repository = PixabayImageRepository();
  List<ImageItem> imageItems = [];
  bool isLoading = false;

  Future searchImage(String input) async {
    setState(() {
      isLoading = true;
    });

    imageItems = await repository.getImageItems(input);

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  hintText: 'Search Image',
                  suffixIcon: IconButton(
                      onPressed: () {
                        searchImage(searchController.text);
                      },
                      icon: Icon(Icons.search))),
            ),
            const SizedBox(
              height: 32,
            ),
            isLoading
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : Expanded(
              child: GridView.builder(
                  itemCount: imageItems.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 32,
                    mainAxisSpacing: 32,
                  ),
                  itemBuilder: (context, index) {
                    final imageItem = imageItems[index];
                    return ImageItemWidget(imageItem: imageItem);
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}
