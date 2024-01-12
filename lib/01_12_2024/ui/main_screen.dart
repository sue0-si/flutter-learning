import 'package:flutter/material.dart';
import 'package:flutter_learning/01_12_2024/ui/item_widget.dart';
import 'package:provider/provider.dart';
import 'main_view_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: 'search image',
                  suffixIcon: IconButton(
                    onPressed: () {
                      viewModel.searchImage(_textController.text);
                    },
                    icon: const Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              viewModel.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: GridView.builder(
                          itemCount: viewModel.imageItems.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16),
                          itemBuilder: (context, index) {
                            final item = viewModel.imageItems[index];
                            return ItemWidget(imageModel: item);
                          }),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
