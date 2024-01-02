import 'package:flutter_learning/01_02_2024/data/model/image_item.dart';

import '../DTO/imageDTO.dart';

extension DTOtoModel on Hits {
  ImageItem toImageItem() {
    return ImageItem(
      imageUrl: previewURL ?? 'https://cdn.pixabay.com/photo/2023/10/20/19/25/moon-8330104_1280.png',
      tags: tags ?? '',
    );
  }
}