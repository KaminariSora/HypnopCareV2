import 'package:flutter/material.dart';

class Page2Bmi extends StatefulWidget {
  const Page2Bmi({super.key});

  @override
  State<Page2Bmi> createState() => _Page2BmiState();
}

class _Page2BmiState extends State<Page2Bmi> {
  String status = 'Normal';
  double bmi = 0.0;
  String? selectedGender;

  void selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }
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
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GenderButton(
                    gender: 'MALE',
                    imagePath: 'assets/male_icon.png',
                    isSelected: selectedGender == 'MALE',
                    onSelect: selectGender,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GenderButton(
                    gender: 'FEMALE',
                    imagePath: 'assets/female_icon.png',
                    isSelected: selectedGender == 'FEMALE',
                    onSelect: selectGender,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
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
              const SizedBox(
                height: 10,
              ),
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
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 365,
                    height: 57,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF5E7F60)),
                        onPressed: () {},
                        child: const Text(
                          'Calculate',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFFFFFF)),
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 365,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 115,
                      child: Image.asset(
                        'assets/happy_face.png',
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          status,
                          style: const TextStyle(
                              fontSize: 24,
                              color: Color(0xFF36AE7C),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          bmi.toString(),
                          style: const TextStyle(
                            fontSize: 64,
                            color: Color(0xFF4F513C),
                          ),
                        ),
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

class GenderButton extends StatelessWidget {
  final String gender;
  final String imagePath;
  final bool isSelected;
  final Function(String) onSelect; // Callback function

  const GenderButton({
    super.key,
    required this.gender,
    required this.imagePath,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelect(gender); // Notify parent about the selection
      },
      child: Container(
        width: 180,
        height: 166,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFBFBB95) : const Color(0xFFF6EBD9),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [BoxShadow(blurRadius: 5)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              gender,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}