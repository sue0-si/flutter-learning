import 'package:flutter/material.dart';
import 'package:flutter_learning/12_27_2023/practice/model/image_item.dart';
import 'package:flutter_learning/12_27_2023/practice/repository/image_item_repository.dart';
import 'package:flutter_learning/12_27_2023/practice/ui/widget/image_item_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final textController = TextEditingController();
  final repository = PixabayImageItemRepository();

  @override
  dispose() {
    super.dispose();
    textController.dispose();
  }

  List<ImageItem> imageItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: textController,
                decoration: InputDecoration(
                  hintText: "Search image",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {});
                    },
                  ),
                ),
              ),
              const SizedBox(height: 32),
              FutureBuilder(
                future: PixabayImageItemRepository()
                    .getImageItems(textController.text),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  final imageItems = snapshot.data;
                  return Expanded(
                      child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16),
                    itemBuilder: (BuildContext context, int index) {
                      final imageItem = imageItems![index];
                      return ImageItemWidget(imageItem: imageItem);
                    },
                  ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
