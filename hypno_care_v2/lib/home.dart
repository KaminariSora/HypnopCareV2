import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 690), // ปรับขนาดตามดีไซน์
        minTextAdapt: true, // ✅ ป้องกันปัญหา LateInitializationError
        splitScreenMode: true,
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF5E7F60),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                    decoration: BoxDecoration(color: Color(0xFF5E7F60)),
                    height: 120.h,
                    child: Column(
                      children: [
                        // เพิ่มข้อความก่อน Row
                        Text(
                          'TODAY',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(7, (index) {
                            DateTime date =
                                today.add(Duration(days: index - 3));

                            return Column(
                              children: [
                                // วางทั้งสี่เหลี่ยมและวงกลมใน Stack
                                Stack(
                                  alignment:
                                      Alignment.center, // ตั้งให้อยู่กลาง
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
                                              ? Colors.grey[
                                                  300]! // ขอบสีเขียวถ้าเป็นวันปัจจุบัน
                                              : Colors
                                                  .transparent!, // ขอบสีเทาถ้าไม่ใช่วันปัจจุบัน
                                          width: 2.w,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(45.r),
                                      ),
                                      child: Text(
                                        DateFormat.E().format(
                                            date), // ชื่อวัน (MON, TUE, ...)
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
                                      top: 30
                                          .h, // ปรับตำแหน่งให้วงกลมซ้อนอยู่กลางสี่เหลี่ยม
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
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF6EBD9),
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
                        top: 20.h, bottom: 10.h, left: 20.w, right: 20.w),
                    height: 200.h,
                    padding: EdgeInsets.all(20.w),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Body Mass Index',
                            style: TextStyle(
                              fontSize: 32.sp,
                              color: Color(0xFF4F513C),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Normal',
                                  style: TextStyle(
                                      color: Color(0xFF5E7F60),
                                      fontSize: 24.sp),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  '23.8',
                                  style: TextStyle(
                                    color: Color(0xFF4F513C),
                                    fontSize: 64.sp,
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
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF6EBD9),
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
                    margin:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                    height: 200.h,
                    padding: EdgeInsets.all(20.w),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Health Diet',
                            style: TextStyle(
                              fontSize: 32.sp,
                              color: Color(0xFF4F513C),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Normal',
                                  style: TextStyle(
                                      color: Color(0xFF5E7F60),
                                      fontSize: 24.sp),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  '23.8',
                                  style: TextStyle(
                                    color: Color(0xFF4F513C),
                                    fontSize: 64.sp,
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
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF6EBD9),
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
                    margin:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                    height: 200.h,
                    padding: EdgeInsets.all(20.w),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Sodium',
                            style: TextStyle(
                              fontSize: 28.sp,
                              color: Color(0xFF4F513C),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Normal',
                                  style: TextStyle(
                                      color: Color(0xFF5E7F60),
                                      fontSize: 24.sp),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  '23.8',
                                  style: TextStyle(
                                    color: Color(0xFF4F513C),
                                    fontSize: 64.sp,
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
                ],
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              color: Color(0xFF5E7F60),
              shape:
                  CircularNotchedRectangle(), // Create notch for FloatingActionButton
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.chat_bubble,
                        color: Colors.white, size: 35.sp),
                    onPressed: () {},
                  ),
                  SizedBox(width: 20), // Space for FloatingActionButton
                  IconButton(
                    icon: Icon(Icons.history, color: Colors.white, size: 40.sp),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Color(0xFFBFBB95),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50), // รูปทรงแบบมน
              ),
              child: Icon(
                Icons.home,
                color: Color(0xFF4F513C),
                size: 45.sp,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          );
        });
  }
}
