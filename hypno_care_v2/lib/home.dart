// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'globalVariable.dart' as globals;

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime today = DateTime.now();

  String bmi = globals.bmi.value;
  String bmiStatus = globals.bmiStatus.value;
  String healthDiet = globals.healthDiet.value;
  String sodium = globals.sodium.value;
  String sodiumStatus = globals.sodiumStatus.value;
  Color sodiumStatusColor = Colors.transparent;
  Color bmiStatusColor = Colors.transparent;
  Color healthDietStatusColor = Colors.transparent;

  @override
  void initState() {
    super.initState();
    globals.bmi.addListener(_updateBmi);
    globals.bmiStatus.addListener(_updateBmiStatus);
    globals.healthDiet.addListener(_updateHealthDiet);
    globals.sodium.addListener(_updateSodium);
    globals.sodiumStatus.addListener(_updateSodiumStatus);
  }

  void _updateBmi() {
    setState(() {
      bmi = globals.bmi.value;
    });
  }

  void _updateBmiStatus() {
    setState(() {
      bmiStatus = globals.bmiStatus.value;
      try {
        if (bmiStatus == 'Underweight') {
          bmiStatusColor = Colors.purple;
        } else if (bmiStatus == 'Normal') {
          bmiStatusColor = const Color(0xFF36AE7C);
        } else if (bmiStatus == 'Obesity grade 1' ||
            bmiStatus == 'Overweight') {
          bmiStatusColor = Colors.blueAccent;
        } else if (bmiStatus == 'Obesity grade 2') {
          bmiStatusColor = Colors.yellow;
        } else if (bmiStatus == 'Obesity grade 3' || bmiStatus == 'Obese') {
          bmiStatusColor = Colors.red;
        } else if (bmiStatus == 'Obese') {
          bmiStatusColor = Colors.red;
        }
      } catch (e) {
        bmiStatus = 'Error!';
        bmiStatusColor = Colors.red;
      }
    });
  }

  void _updateHealthDiet() {
    setState(() {
      healthDiet = globals.healthDiet.value;
      if (healthDiet == 'Good') {
        healthDietStatusColor = const Color(0xFF36AE7C);
      } else {
        healthDietStatusColor = Colors.red;
      }
    });
  }

  void _updateSodium() {
    setState(() {
      sodium = globals.sodium.value;
    });
  }

  void _updateSodiumStatus() {
    setState(() {
      sodiumStatus = globals.sodiumStatus.value;
      try {
        if (sodiumStatus == 'High Risk') {
          sodiumStatusColor = Colors.red;
        } else if (sodiumStatus == 'Moderate Risk') {
          sodiumStatusColor = const Color.fromARGB(255, 232, 185, 31);
        } else if (sodiumStatus == 'Safe') {
          sodiumStatusColor = Colors.green;
        }
      } catch (e) {
        bmiStatus = 'Error!';
        bmiStatusColor = Colors.red;
      }
    });
  }

  @override
  void dispose() {
    globals.bmi.removeListener(_updateBmi);
    globals.bmiStatus.removeListener(_updateBmiStatus);
    globals.healthDiet.removeListener(_updateHealthDiet);
    globals.sodium.removeListener(_updateSodium);
    globals.sodiumStatus.removeListener(_updateSodiumStatus);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690), // ปรับขนาดตามดีไซน์
        minTextAdapt: true, // ✅ ป้องกันปัญหา LateInitializationError
        splitScreenMode: true,
        builder: (context, child) {
          return Scaffold(
            backgroundColor: const Color(0xFFF2E5D2),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(120.h), // กำหนดความสูงของ AppBar
              child: AppBar(
                backgroundColor: const Color(0xFF5E7F60),
                centerTitle: true,
                title: Text(
                  'TODAY',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                flexibleSpace: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  decoration: const BoxDecoration(color: Color(0xFF5E7F60)),
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.end, // จัดให้แสดงด้านล่าง
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(7, (index) {
                          DateTime date = today.add(Duration(days: index - 3));

                          return Column(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  // กล่องสี่เหลี่ยมรอบชื่อวัน
                                  Container(
                                    width: 45.w,
                                    height: 65.h,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4.h, horizontal: 8.w),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: date.day == today.day
                                            ? Colors.white
                                            : Colors.transparent,
                                        width: 2.w,
                                      ),
                                      borderRadius: BorderRadius.circular(45.r),
                                    ),
                                    child: Text(
                                      DateFormat.E().format(date),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[300],
                                      ),
                                    ),
                                  ),
                                  // วงกลมรอบวันที่
                                  Positioned(
                                    top: 30.h,
                                    child: Container(
                                      width: 30.w,
                                      height: 30.h,
                                      decoration: BoxDecoration(
                                        color: date.day == today.day
                                            ? Colors.green[400]
                                            : Colors.transparent,
                                        shape: BoxShape.circle,
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${date.day}",
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/BMI');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6EBD9),
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: Offset(4.w, 4.h),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(
                          top: 10.h, bottom: 5.h, left: 20.w, right: 20.w),
                      height: 130.h,
                      padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 10.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Body Mass Index',
                              style: TextStyle(
                                fontSize: 28.sp,
                                color: const Color(0xFF4F513C),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    bmiStatus,
                                    style: TextStyle(
                                        color: bmiStatusColor, fontSize: 24.sp),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    bmi,
                                    style: TextStyle(
                                      color: const Color(0xFF4F513C),
                                      fontSize: 35.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/Healthdiet');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6EBD9),
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: Offset(4.w, 4.h),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(
                          top: 10.h, bottom: 5.h, left: 20.w, right: 20.w),
                      height: 130.h,
                      padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 10.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Health Diet',
                              style: TextStyle(
                                fontSize: 28.sp,
                                color: const Color(0xFF4F513C),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '',
                                    style: TextStyle(
                                        color: const Color(0xFF5E7F60),
                                        fontSize: 24.sp),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    healthDiet,
                                    style: TextStyle(
                                      color: healthDietStatusColor,
                                      fontSize: 32.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/Sodium');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6EBD9),
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: Offset(4.w, 4.h),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(
                          top: 10.h, bottom: 5.h, left: 20.w, right: 20.w),
                      height: 130.h,
                      padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 10.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Sodium',
                              style: TextStyle(
                                fontSize: 28.sp,
                                color: const Color(0xFF4F513C),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    sodiumStatus,
                                    style: TextStyle(
                                        color: sodiumStatusColor,
                                        fontSize: 20.sp),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    sodium,
                                    style: TextStyle(
                                      color: const Color(0xFF4F513C),
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              color: const Color(0xFF5E7F60),
              shape:
                  const CircularNotchedRectangle(), // Create notch for FloatingActionButton
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.chat_bubble,
                        color: Colors.white, size: 35.sp),
                    onPressed: () {
                      Navigator.pushNamed(context, '/Chat');
                    },
                  ),
                  const SizedBox(width: 20), // Space for FloatingActionButton
                  IconButton(
                    icon: Icon(Icons.history,
                        color: Colors.transparent, size: 40.sp),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              backgroundColor: const Color(0xFFBFBB95),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50), // รูปทรงแบบมน
              ),
              child: Icon(
                Icons.home,
                color: const Color(0xFF4F513C),
                size: 45.sp,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          );
        });
  }
}
