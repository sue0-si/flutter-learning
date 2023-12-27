import 'package:flutter_learning/12_27_2023/practice/data_source/pixabay_api.dart';
import 'package:flutter_learning/12_27_2023/practice/mapper/image_mapper.dart';
import 'package:flutter_learning/12_27_2023/practice/model/image_item.dart';
import 'package:flutter_learning/12_27_2023/practice/ui/widget/not_found.dart';

abstract interface class ImageItemRepository {
  Future<List<ImageItem>> getImageItems(String query);
}

class PixabayImageItemRepository implements ImageItemRepository {
  final _api = PixabayApi();

  @override
  Future<List<ImageItem>> getImageItems(String query) async {
    final dto = await _api.getImagesResult(query);
    if (dto.hits == null) {
      return [];
    }
    return dto.hits!.map((e) => e.toImageItem()).toList();
  }
}


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
