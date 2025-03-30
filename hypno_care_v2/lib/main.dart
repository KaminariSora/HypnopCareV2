import 'package:flutter/material.dart';
import 'package:hypno_care_v2/const.dart';
import 'package:hypno_care_v2/page4_sodium.dart';
import 'page3_healthdiet.dart';
import 'page2_bmi.dart';
import 'page5_chat.dart';
import 'testpage.dart';
import 'package:hypno_care_v2/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const Home(),
          '/BMI': (context) => const Page2Bmi(),
          '/Healthdiet': (context) => const Page3Healthdiet(),
          '/Sodium': (context) => const Page4sodium(),
          '/Chat': (context) => const ChatScreen(),
        },
        theme: ThemeData(
            primarySwatch: Colors.green,
            visualDensity: VisualDensity.adaptivePlatformDensity));
  }
}
