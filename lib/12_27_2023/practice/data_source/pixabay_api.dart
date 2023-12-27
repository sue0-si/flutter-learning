import 'dart:convert';

import 'package:http/http.dart' as http;

import '../DTO/image_dto.dart';

class PixabayApi {
  Future<ImageDTO> getImagesResult(String query) async {
    final response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=41487319-e44be603f18af5945993f7a89&q=$query&image_type=photo'));
    return ImageDTO.fromJson(jsonDecode(response.body));
  }
}
