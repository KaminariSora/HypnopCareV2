import 'package:flutter/material.dart';

class Page2Bmi extends StatefulWidget {
  const Page2Bmi({super.key});

  @override
  State<Page2Bmi> createState() => _Page2BmiState();
}

class _Page2BmiState extends State<Page2Bmi> {
  String status = 'Normal';
  Color statusColor = const Color(0xFF36AE7C);
  double bmi = 0.0;
  String? selectedGender;
  String emotion = 'assets/happy_face.jpg';
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  void _getValue() {
    String weight = _weightController.text;
    String height = _heightController.text;
    String age = _ageController.text;

    if (weight.isEmpty ||
        height.isEmpty ||
        age.isEmpty ||
        selectedGender == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all the fields!')),
      );
      return;
    }

    double weightValue = double.tryParse(weight) ?? 0.0;
    double heightValue = double.tryParse(height) ?? 0.0;
    double heightvalueMeter = heightValue / 100;
    int ageValue = int.tryParse(age) ?? 20;

    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        bmi = weightValue / (heightvalueMeter * heightvalueMeter);
        if (ageValue < 20) {
          if (selectedGender == 'Male') {
            if (bmi < 17) {
              emotion = 'assets/purple_face.jpg';
              status = 'Underweight';
              statusColor = Colors.purple;
            } else if (bmi >= 17 && bmi < 22) {
              emotion = 'assets/happy_face.jpg';
              status = 'Normal';
              statusColor = const Color(0xFF36AE7C);
            } else if (bmi >= 22 && bmi < 25) {
              emotion = 'assets/blue_face.jpg';
              status = 'Overweight';
              statusColor = Colors.blueAccent;
            } else if (bmi >= 25){
              emotion = 'assets/angry_face.jpg';
              status = 'Obese';
              statusColor = Colors.red;
            } else {
              emotion = 'assets/yellow_face.jpg';
              status = '';
              statusColor = Colors.black;
            }
          } else if (selectedGender == 'Female') {
            if (bmi < 16.5) {
              emotion = 'assets/purple_face.jpg';
              status = 'Underweight';
              statusColor = Colors.purple;
            } else if (bmi >= 16.5 && bmi < 21.5) {
              emotion = 'assets/happy_face.jpg';
              status = 'Normal';
              statusColor = const Color(0xFF36AE7C);
            } else if (bmi >= 21.5 && bmi < 24.5) {
              emotion = 'assets/blue_face.jpg';
              status = 'Overweight';
              statusColor = Colors.blueAccent;
            } else if (bmi >= 24.5){
              emotion = 'assets/angry_face.jpg';
              status = 'Obese';
              statusColor = Colors.red;
            } else {
              emotion = 'assets/yellow_face.jpg';
              status = '';
              statusColor = Colors.black;
            }
          }
        } else {
          if (bmi < 18.5) {
            // ผอม
            emotion = 'assets/purple_face.jpg';
            status = 'Underweight';
            statusColor = Colors.purple;
          } else if (bmi >= 18.5 && bmi < 22.9) {
            // ปกติ
            emotion = 'assets/happy_face.jpg';
            status = 'Normal';
            statusColor = const Color(0xFF36AE7C);
          } else if (bmi >= 23 && bmi < 24.9) {
            // ท้วม 1
            emotion = 'assets/blue_face.jpg';
            status = 'Obesity grade 1';
            statusColor = Colors.blueAccent;
          } else if (bmi >= 25 && bmi < 29.9) {
            // ท้วม 2
            emotion = 'assets/yellow_face.jpg';
            status = 'Obesity grade 2';
            statusColor = Colors.yellow;
          } else if (bmi >= 29.9){
            // ท้วม 3
            emotion = 'assets/angry_face.jpg';
            status = 'Obesity grade 3';
            statusColor = Colors.red;
          } else {
              emotion = 'assets/yellow_face.jpg';
              status = 'Number only!';
              statusColor = Colors.black;
              bmi = 0.0;
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  void selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2E5D2),
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
                    gender: 'Male',
                    imagePath: 'assets/male_icon.png',
                    isSelected: selectedGender == 'Male',
                    onSelect: selectGender,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GenderButton(
                    gender: 'Female',
                    imagePath: 'assets/female_icon.png',
                    isSelected: selectedGender == 'Female',
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InputBox(
                          input: SizedBox(
                            width: 200,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: _heightController,
                              decoration: InputDecoration(
                                hintText: 'Enter height (cm)',
                                hintStyle: const TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: const Color(0xFFF6EBD9),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide.none, // Remove default border
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF5E7F60), width: 2),
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 5),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 12),
                              ),
                            ),
                          ),
                          label: 'Height (cm)',
                        )
                      ],
                    ),
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
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return SizedBox(
                            height: constraints.maxHeight,
                            child: Column(
                              children: [
                                Expanded(
                                  child: InputBox(
                                      input: SizedBox(
                                        width: 150,
                                        child: TextField(
                                          keyboardType: TextInputType.number,
                                          controller: _weightController,
                                          decoration: InputDecoration(
                                            hintText: 'Enter weight',
                                            hintStyle: const TextStyle(
                                                color: Colors.grey),
                                            filled: true,
                                            fillColor: const Color(0xFFF6EBD9),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide
                                                  .none, // Remove default border
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Color(0xFF5E7F60),
                                                  width: 2),
                                            ),
                                            enabledBorder:
                                                const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey, width: 5),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 12),
                                          ),
                                        ),
                                      ),
                                      label: 'Weight'),
                                ),
                              ],
                            ),
                          );
                        },
                      )),
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
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return SizedBox(
                            height: constraints.maxHeight,
                            child: Column(
                              children: [
                                Expanded(
                                  child: InputBox(
                                      input: SizedBox(
                                        width: 150,
                                        child: TextField(
                                          keyboardType: TextInputType.number,
                                          controller: _ageController,
                                          decoration: InputDecoration(
                                            hintText: 'Enter age',
                                            hintStyle: const TextStyle(
                                                color: Colors.grey),
                                            filled: true,
                                            fillColor: const Color(0xFFF6EBD9),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide
                                                  .none, // Remove default border
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Color(0xFF5E7F60),
                                                  width: 2),
                                            ),
                                            enabledBorder:
                                                const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey, width: 5),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 12),
                                          ),
                                        ),
                                      ),
                                      label: 'Age'),
                                ),
                              ],
                            ),
                          );
                        },
                      )),
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
                        onPressed: _getValue,
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
                        emotion,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          status,
                          style: TextStyle(
                              fontSize: 24,
                              color: statusColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          bmi.toStringAsFixed(2),
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

class InputBox extends StatelessWidget {
  final Widget input;
  final String label;

  const InputBox({super.key, required this.input, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 8),
        input, // Pass any input widget here
      ],
    );
  }
}
