import 'package:flutter/material.dart';

class Page3Healthdiet extends StatefulWidget {
  const Page3Healthdiet({super.key});

  @override
  _Page3HealthdietState createState() => _Page3HealthdietState();
}

class _Page3HealthdietState extends State<Page3Healthdiet> {
  double progressValue = 0.0;
  String status = 'GOOD';

  void updateProgress() {
    setState(() {
      progressValue += 0.1;
      if (progressValue > 1.0) {
        progressValue = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2E5D2),
      appBar: AppBar(
        title: const Text("Diet",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFFFFF),
            )),
        centerTitle: true,
        backgroundColor: const Color(0xFF5E7F60),
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF6EBD9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [BoxShadow(blurRadius: 10)],
                ),
                child: Column(
                  children: [
                    Table(
                      columnWidths: const {
                        0: FlexColumnWidth(),
                        1: FlexColumnWidth(),
                        2: FlexColumnWidth(),
                      },
                      children: [
                        buildRow(
                          ['', 'ซ้อน', 'ทัพพี'],
                          isHeader: true,
                          img: [
                            null,
                            'assets/Spoon.png',
                            'assets/WoodLadel.png'
                          ],
                        ),
                        buildRowWithImages(['0.0 g.\nเนื้อสัตว์', '10', '10']),
                        buildRowWithImages(['0.0 g.\nข้าว', '50', '0']),
                        buildRowWithImages(['0.0 g.\nผัก', '100', '30']),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(status,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF36AE7C)
                      ),),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFF6EBD9),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [BoxShadow(blurRadius: 10)]),
                child: Column(
                  children: [
                    Table(
                      columnWidths: const {
                        0: FlexColumnWidth(),
                      },
                      children: [
                        buildRow(['', 'ซิ้น', 'ผล'],
                            isHeader: true,
                            img: [
                              null,
                              'assets/Apple.png',
                              'assets/OnePieceOfApple.jpg'
                            ]),
                        buildRowWithImages(['0.0 g.\nผลไม้', '0', '0']),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    buildProgressBar(progressValue),
                    const SizedBox(height: 20,),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFF6EBD9),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [BoxShadow(blurRadius: 10)]),
                child: Column(
                  children: [
                    Table(
                      columnWidths: const {
                        0: FlexColumnWidth(),
                        1: FlexColumnWidth(),
                        2: FlexColumnWidth(),
                      },
                      children: [
                        buildRow(['', 'กล่อง', 'แก้ว'],
                            isHeader: true,
                            img: [
                              null,
                              'assets/Milk.png',
                              'assets/glass_of_milk.png',
                            ]),
                        buildRowWithImages(['0.0 g.\nนม', '10', '10']),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    buildProgressBar(progressValue),
                    const SizedBox(height: 20,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDietTable(
      List<String> headers, String img1, String img2, String data) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF6EBD9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(blurRadius: 10)],
      ),
      child: Table(
        columnWidths: const {0: FlexColumnWidth()},
        children: [
          buildRow(headers, isHeader: true, img: [null, img1, img2]),
          buildRowWithImages([data, '0', '0']),
        ],
      ),
    );
  }
}

TableRow buildRow(List<String> cells,
    {bool isHeader = false, required List<String?> img}) {
  return TableRow(
    children: cells.asMap().entries.map((entry) {
      int index = entry.key;
      String cell = entry.value;

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            if (index < img.length && img[index] != null)
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xFFBFBB95),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      img[index]!, // Load different images for each cell
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            Text(
              cell,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      );
    }).toList(),
  );
}

TableRow buildRowWithImages(List<String> cells) {
  return TableRow(
    children: [
      buildTextCell(cells[0]),
      buildImageButtonCell(cells[1]),
      buildImageButtonCell(cells[2]),
    ],
  );
}

Widget buildTextCell(String text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget buildImageButtonCell(String text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Text(text),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: IconButton(
                icon: Image.asset('assets/minus_button.png'),
                iconSize: 10,
                onPressed: () {
                  print("Button pressed!");
                },
              ),
            ),
            Flexible(
              child: IconButton(
                icon: Image.asset('assets/plus_button.png'),
                iconSize: 40,
                onPressed: () {
                  print("Button pressed!");
                },
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget buildProgressBar(double progressValue) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: LinearProgressIndicator(
          value: progressValue,
          minHeight: 24,
          backgroundColor: Colors.grey[300],
          valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF4F513C)),
        ),
      ),
    );
  }