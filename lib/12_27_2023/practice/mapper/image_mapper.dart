import 'package:flutter_learning/12_27_2023/practice/DTO/image_dto.dart';
import 'package:flutter_learning/12_27_2023/practice/model/image_item.dart';

extension DTOtoModel on Hits {
  ImageItem toImageItem() {
    return ImageItem(
        imageUrl: previewURL ??
            'https://cdn.pixabay.com/photo/2023/12/08/16/07/chocolate-8437801_1280.jpg',
        id: tags ?? '');
  }
}
