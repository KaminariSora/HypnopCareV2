import 'package:flutter/material.dart';
import 'package:hypno_care_v2/const.dart';
import 'page3_healthdiet.dart';
import 'page2_bmi.dart';
import 'page5_chat.dart'; 
import 'testpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: const ChatScreen(),
    );
  }
}