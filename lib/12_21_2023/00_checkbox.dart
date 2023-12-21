import 'package:flutter/material.dart';

void main() {
  runApp(const CheckBoxListScreen());
}

class CheckBoxListScreen extends StatefulWidget {
  const CheckBoxListScreen({super.key});

  @override
  State<CheckBoxListScreen> createState() => _CheckBoxListScreenState();
}

class _CheckBoxListScreenState extends State<CheckBoxListScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [

          CheckboxListTile(
              title: Text('홍길동'),
              value: true,
              onChanged: (value) {

              },
          ),
          CheckboxListTile(
            title: Text('홍길동'),
            value: true,
            onChanged: (value) {

            },
          ),
        ],
      ),
    );
  }
}
