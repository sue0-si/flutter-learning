import '../model/image_model.dart';

abstract interface class ImageRepository {
  Future<List<ImageModel>> getImageItems(String query);
}