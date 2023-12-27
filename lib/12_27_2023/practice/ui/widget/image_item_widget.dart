import 'package:flutter/cupertino.dart';
import 'package:flutter_learning/12_27_2023/practice/model/image_item.dart';

class ImageItemWidget extends StatelessWidget {
  final ImageItem imageItem;

  const ImageItemWidget({super.key, required this.imageItem});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.network(imageItem.imageUrl, fit: BoxFit.cover),

    );
  }
}
