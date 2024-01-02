import 'package:flutter/material.dart';
import 'package:flutter_learning/01_02_2024/data/repository/image_repository.dart';
import '../data/model/image_item.dart';

class MainViewModel extends ChangeNotifier {
  final repository = PixabayImageRepository();
  List<ImageItem> imageItems = [];
  bool isLoading = false;

  Future<void> searchImage(String input) async {
    isLoading = true;
    notifyListeners();

    imageItems = await repository.getImageItems(input);
    isLoading = false;
    notifyListeners();
  }
}