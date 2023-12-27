import 'package:flutter/material.dart';
import 'package:flutter_learning/12_27_2023/practice/model/image_item.dart';
import 'package:flutter_learning/12_27_2023/practice/repository/image_item_repository.dart';
import 'package:flutter_learning/12_27_2023/practice/ui/widget/image_item_widget.dart';
import 'package:flutter_learning/12_27_2023/practice/ui/widget/not_found.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final searchController = TextEditingController();
  final repository = PixabayImageItemRepository();

  List<ImageItem> imageItems = [];
  bool isLoading = false;

  Future<void> searchImage(String query) async {
    setState(() {
      isLoading = true;
    });
    imageItems = await repository.getImageItems(query);
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
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Search image',
                suffixIcon: IconButton(
                  color: Color(0xFF4FB6B2),
                  onPressed: () {
                    searchImage(searchController.text);
                  },
                  icon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : searchController.text != '' && imageItems.isEmpty
                    ? const NotFound()
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
                            return ImageItemWidget(
                              imageItem: imageItem,
                            );
                          },
                        ),
                      )
          ],
        ),
      )),
    );
  }
}
