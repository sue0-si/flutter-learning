import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Text("No results found"),
          SizedBox(height: 10),
          Icon(Icons.sentiment_dissatisfied),
        ],
      ),
    );
  }
}
