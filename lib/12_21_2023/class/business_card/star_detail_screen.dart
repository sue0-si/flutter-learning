import 'package:flutter/material.dart';
import './lib/12_20_2023/class/model/star.dart';

class StarDetailScreen extends StatelessWidget {
  final Star star;

  const StarDetailScreen({
    super.key,
    required this.star,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Hero(
            tag: star.id,
            child: Image.network(star.imageUrl),
          ),
          Text(star.title),
          Text(star.description),
        ],
      ),
    );
  }
}