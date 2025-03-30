import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'sodium_list/food_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Page4sodium extends StatefulWidget {
  const Page4sodium({super.key});

  @override
  State<Page4sodium> createState() => _Page4sodiumState();
}

class _Page4sodiumState extends State<Page4sodium> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690), // ปรับขนาดตามดีไซน์
        minTextAdapt: true, // ✅ ป้องกันปัญหา LateInitializationError
        splitScreenMode: true,
        builder: (context, child) {
          return Scaffold(
            backgroundColor: const Color(0xFFF2E5D2),
            appBar: AppBar(
              title: const Text("Daily Sodium",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF),
                  )),
              centerTitle: true,
              backgroundColor: const Color(0xFF5E7F60),
              elevation: 4,
            ),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 200.h,
                          width: 200.h,
                          child: const CircularProgressIndicator(
                            color: Color(0xFF5E7F60),
                            backgroundColor: Color(0xFFBFBB95),
                            value: 0.5,
                            strokeWidth: 20,
                          ),
                        ),
                        const Text(
                          "70%",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    SizedBox(
                      height: 200.h,
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ), // กล่องแสดงปริมาณโซเดียม
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFBFBB95),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Total Sodium: 0 mg',
                        style:
                            TextStyle(fontSize: 18, color: Color(0xFF4F513C)),
                      ),
                    ),
                    const SizedBox(height: 20), // ปุ่ม Confirm
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF5E7F60),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: const Text(
                        'Confirm',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
