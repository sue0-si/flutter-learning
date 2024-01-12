import 'package:flutter/foundation.dart';
import 'package:flutter_learning/01_12_2024/data/repository/image_repository_impl.dart';

import '../data/model/image_model.dart';

class MainViewModel extends ChangeNotifier {
  final repository = ImageRepositoryImpl();
  bool isLoading = false;
  List<ImageModel> imageItems = [];

  Future searchImage(String query) async {
    isLoading = true;
    notifyListeners();

    imageItems = await repository.getImageItems(query);
    isLoading = false;
    notifyListeners();
  }
}