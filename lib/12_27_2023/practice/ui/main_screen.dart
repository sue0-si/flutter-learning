import 'package:flutter/material.dart';
import 'package:flutter_learning/12_27_2023/practice/model/image_item.dart';
import 'package:flutter_learning/12_27_2023/practice/ui/widget/image_item_widget.dart';

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
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Search image',
                suffixIcon: const Icon(
                  Icons.search,
                  color: Color(0xFF4FB6B2),
                ),
              ),
            ),
            SizedBox(height: 32,),
            Expanded(
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 32,
                  mainAxisSpacing: 32,
                ),
                itemBuilder: (context, index) {
                  final imageItem = ImageItem(
                      imageUrl:
                          'https://cdn.pixabay.com/photo/2017/09/26/13/21/apples-2788599_150.jpg',
                      id: 'apple');
                  return ImageItemWidget(imageItem: imageItem,);
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
