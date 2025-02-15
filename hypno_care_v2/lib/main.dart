import 'package:flutter/material.dart';
import 'page3_healthdiet.dart';
import 'page2_bmi.dart';
import 'page5_chat.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ChatScreen(),
    );
  }
}