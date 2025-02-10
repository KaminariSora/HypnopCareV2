import 'package:flutter/material.dart';

class Page2Bmi extends StatefulWidget {
  const Page2Bmi({super.key});

  @override
  State<Page2Bmi> createState() => _Page2BmiState();
}

class _Page2BmiState extends State<Page2Bmi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculate",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFFFFF),
            )),
        centerTitle: true,
        backgroundColor: const Color(0xFF5E7F60),
        elevation: 4,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 180,
                    height: 166,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6EBD9),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [BoxShadow(blurRadius: 5)],
                    ),
                    child: Image.asset('assets/plus_button.png'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 180,
                    height: 166,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6EBD9),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [BoxShadow(blurRadius: 5)],
                    ),
                    child: Image.asset('assets/plus_button.png'),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 365,
                    height: 166,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6EBD9),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [BoxShadow(blurRadius: 5)],
                    ),
                    child: Image.asset('assets/plus_button.png'),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 180,
                    height: 166,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6EBD9),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [BoxShadow(blurRadius: 5)],
                    ),
                    child: Image.asset('assets/plus_button.png'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 180,
                    height: 166,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6EBD9),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [BoxShadow(blurRadius: 5)],
                    ),
                    child: Image.asset('assets/plus_button.png'),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 365,
                    height: 57,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF5E7F60)
                      ),
                      onPressed: (){}, 
                      child: const Text(
                        'Calculate',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFFFF)
                        ),)),
                  )
              ],),
              const SizedBox(height: 10,),
              SizedBox(
                width: 365,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 115,
                      child: Image.asset(
                        'assets/h.png',),
                    ),
                    const SizedBox(width: 20,),
                    Column(
                      children: [
                        Text(
                          'Normal',
                          style: TextStyle(
                            fontSize: 24,
                            color: Color(0xFF36AE7C),
                            fontWeight: FontWeight.bold
                          ),),
                        Text(
                          '0.0',
                          style: TextStyle(
                            fontSize: 64,
                            color: Color(0xFF4F513C),
                          ),),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
