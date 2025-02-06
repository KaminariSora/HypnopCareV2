import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // เริ่มต้น ScreenUtil
    ScreenUtil.init(
      context,
      designSize: Size(440, 956),
      minTextAdapt: true,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TODAY',
          style: TextStyle(color: Colors.white, fontSize: 20.sp),
        ),
        backgroundColor: const Color(0xFF5E7F60),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Color(0xFF5E7F60)),
              height: 100.h,
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
                                color: Color(0xFF5E7F60), fontSize: 24.sp),
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
              margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
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
                                color: Color(0xFF5E7F60), fontSize: 24.sp),
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
              margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
              height: 200.h,
              padding: EdgeInsets.all(20.w),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Sodium',
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
                                color: Color(0xFF5E7F60), fontSize: 24.sp),
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF5E7F60),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble,
              color: Colors.white,
              size: 30.sp,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                color: Color(0xFFBFBB95),
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.home,
                color: Colors.white,
                size: 30.sp,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
              color: Colors.white,
              size: 30.sp,
            ),
            label: '',
          ),
        ],
        onTap: (index) {},
      ),
    );
  }
}
