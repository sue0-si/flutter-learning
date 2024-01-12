import 'package:flutter_learning/01_12_2024/data/mapper/image_mapper.dart';

import '../model/image_model.dart';
import '../source/image_api.dart';
import 'image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  final _api = ImageApi();

  @override
  Future<List<ImageModel>> getImageItems(String query) async {
    final dto = await _api.getImagesResult(query);
    if (dto.hits == null) {
      return [];
    }
    return dto.hits!.map((e) => e.toModel()).toList();
  }

}