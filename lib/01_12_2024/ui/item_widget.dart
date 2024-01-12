import 'package:flutter/cupertino.dart';

import '../data/model/image_model.dart';

class ItemWidget extends StatelessWidget {
  final ImageModel imageModel;
  const ItemWidget({super.key, required this.imageModel});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(
        imageModel.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
