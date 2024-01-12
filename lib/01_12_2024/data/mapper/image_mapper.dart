import '../DTO/image_dto.dart';
import '../model/image_model.dart';

extension DtoToModel on Hits {
  ImageModel toModel() {
    return ImageModel(imageUrl: previewURL ?? '', tags: tags ?? '');
  }
}