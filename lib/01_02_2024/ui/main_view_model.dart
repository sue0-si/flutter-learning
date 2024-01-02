import 'package:flutter_learning/01_02_2024/data/repository/image_repository.dart';
import '../data/model/image_item.dart';

class MainViewModel {
  final repository = PixabayImageRepository();
  List<ImageItem> imageItems = [];
  bool isLoading = false;

  Future<void> searchImage(String input) async {
    imageItems = await repository.getImageItems(input);
  }
}