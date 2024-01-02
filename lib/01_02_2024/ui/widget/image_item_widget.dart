import 'package:flutter/material.dart';
import 'package:flutter_learning/01_02_2024/data/model/image_item.dart';

class ImageItemWidget extends StatelessWidget {
  final ImageItem imageItem;
  const ImageItemWidget({
    super.key,
    required this.imageItem,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Image.network(
        imageItem.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
