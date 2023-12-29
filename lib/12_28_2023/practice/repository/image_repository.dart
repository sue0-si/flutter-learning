import 'package:flutter_learning/12_28_2023/practice/mapper/image_mapper.dart';
import 'package:flutter_learning/12_28_2023/practice/model/image_item.dart';
import '../../../12_27_2023/practice/data_source/pixabay_api.dart';


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
    return dto.hits!.map((e) => e.toImageItemList()).toList();
  }
}