import 'package:flutter/material.dart';
import 'package:flutter_learning/01_12_2024/ui/main_screen.dart';
import 'package:flutter_learning/01_12_2024/ui/main_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (context) {
          return MainViewModel();
        },
        child: const MainScreen(),
      ),
    );
  }
}
