import 'package:flutter/material.dart';
import 'package:flutter_learning/01_02_2024/ui/main_view_model.dart';

import 'widget/image_item_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final searchController = TextEditingController();
  final viewModel = MainViewModel();

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
                      onPressed: () async {
                        setState(() {
                          viewModel.isLoading = true;
                        });
                        await viewModel.searchImage(searchController.text);
                        setState(() {
                          viewModel.isLoading = false;
                        });
                      },
                      icon: Icon(Icons.search))),
            ),
            const SizedBox(
              height: 32,
            ),
            viewModel.isLoading
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : Expanded(
              child: GridView.builder(
                  itemCount: viewModel.imageItems.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 32,
                    mainAxisSpacing: 32,
                  ),
                  itemBuilder: (context, index) {
                    final imageItem = viewModel.imageItems[index];
                    return ImageItemWidget(imageItem: imageItem);
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}
