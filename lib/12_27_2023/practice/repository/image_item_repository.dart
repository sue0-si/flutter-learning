import 'package:flutter_learning/12_27_2023/practice/model/image_item.dart';

// dummy data
class MockImageItemRepository {
  Future<List<ImageItem>> getImage(String query) async {
    await Future.delayed(const Duration(seconds: 1));

    if (query == '겨울') {
      return [
        ImageItem(
            imageUrl:
            'https://cdn.pixabay.com/photo/2023/12/06/08/56/winter-8433264_960_720.jpg',
            id: '겨울'
        ),
      ];
    } else {
      return [
        ImageItem(
            imageUrl:
            'https://cdn.pixabay.com/photo/2023/12/08/16/07/chocolate-8437801_1280.jpg',
            id: ''
        ),
      ];
    }
  }
}
