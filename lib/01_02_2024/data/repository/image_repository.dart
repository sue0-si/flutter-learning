import 'package:flutter_learning/01_02_2024/data/data_source/pixabay_api.dart';
import 'package:flutter_learning/01_02_2024/data/mapper/image_mapper.dart';
import 'package:flutter_learning/01_02_2024/data/model/image_item.dart';

abstract interface class ImageRepository{
  Future<List<ImageItem>> getImageItems(String input);
}

class PixabayImageRepository implements ImageRepository {
  final _api = PixabayApi();

  @override
  Future<List<ImageItem>> getImageItems(String input) async {
    final dto = await _api.getImagesResult(input);
    if (dto.hits == null) {
      return [];
    }
    return dto.hits!.map((e) => e.toImageItem()).toList();
  }

}