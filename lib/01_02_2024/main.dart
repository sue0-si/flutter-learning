import 'package:flutter/material.dart';
import 'package:flutter_learning/01_02_2024/ui/main_screen.dart';
import 'package:flutter_learning/01_02_2024/ui/main_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "api practice 3 - Provider",
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (BuildContext context) => MainViewModel(),
        child: const MainScreen(),
      ),
    );
  }
}
