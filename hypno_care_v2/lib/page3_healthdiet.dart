import 'package:flutter/material.dart';

class Page3Healthdiet extends StatefulWidget {
  const Page3Healthdiet({super.key});

  @override
  _Page3HealthdietState createState() => _Page3HealthdietState();
}

class _Page3HealthdietState extends State<Page3Healthdiet> {
  int meatSpoon = 0;
  int meatLadel = 0;
  double meatTotal = 0.0;
  int riceSpoon = 0;
  int riceLadel = 0;
  double riceTotal = 0.0;
  int vegetableSpoon = 0;
  int vegetableLadel = 0;
  double vegetableTotal = 0.0;
  String status = 'GOOD';

  int fruitPiece = 0;
  int fruit = 0;
  double fruitTotal = 0.0;
  double progressFruitValue = 0.5;

  int milkGrass = 0;
  int milkCarton = 0;
  double milkTotal = 0.0;
  double progressMilkValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2E5D2),
      appBar: AppBar(
        title: const Text("Health Diet",
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
                        buildRowWithImages([
                          '${meatTotal.toString()} g.\nเนื้อสัตว์',
                          meatSpoon.toString(),
                          meatLadel.toString()
                        ],
                        () {
                          setState(() {
                            if (meatSpoon > 0) {
                            meatSpoon--;
                            meatTotal = (meatTotal - 5 >= 0) ? meatTotal - 5 : 0;  // Ensure meatTotal is not negative
                          }
                          });
                        },   // Minus Spoon
                        () {
                          setState(() {
                            meatSpoon++;
                            meatTotal += 5;
                          });
                        },  // Plus Spoon
                        () {
                          setState(() {
                            if (meatLadel > 0) {
                            meatLadel--;
                            meatTotal = (meatTotal - 10 >= 0) ? meatTotal - 10 : 0;  // Ensure meatTotal is not negative
                          }
                          });
                        },   // Minus Spoon
                        () {
                          setState(() {
                            meatLadel++;
                            meatTotal += 10;
                          });
                        },
                        ),
                        buildRowWithImages([
                          '${riceTotal.toString()} g.\nข้าว',
                          riceSpoon.toString(),
                          riceLadel.toString()
                        ],
                        () {
                          setState(() {
                            if (riceSpoon > 0) {
                            riceSpoon--;
                            riceTotal = (riceTotal - 5 >= 0) ? riceTotal - 5 : 0;
                          }
                          });
                        },   // Minus Spoon
                        () {
                          setState(() {
                            riceSpoon++;
                            riceTotal += 5;
                          });
                        },  // Plus Spoon
                        () {
                          setState(() {
                            if (riceLadel > 0) {
                            riceLadel--;
                            riceTotal = (riceTotal - 10 >= 0) ? riceTotal - 10 : 0;
                          }
                          });
                        },   // Minus Spoon
                        () {
                          setState(() {
                            riceLadel++;
                            riceTotal += 10;
                          });
                        },
                        ),
                        buildRowWithImages([
                          '${vegetableTotal.toString()} g.\nผัก',
                          vegetableSpoon.toString(),
                          vegetableLadel.toString()
                        ],
                        () {
                          setState(() {
                            if (vegetableSpoon > 0) {
                            vegetableSpoon--;
                            vegetableTotal = (vegetableTotal - 5 >= 0) ? vegetableTotal - 5 : 0;  // Ensure vegetableTotal is not negative
                          }
                          });
                        },   // Minus Spoon
                        () {
                          setState(() {
                            vegetableSpoon++;
                            vegetableTotal += 5;
                          });
                        },  // Plus Spoon
                        () {
                          setState(() {
                            if (vegetableLadel > 0) {
                            vegetableLadel--;
                            vegetableTotal = (vegetableTotal - 10 >= 0) ? vegetableTotal - 10 : 0;
                          }
                          });
                        },   // Minus Spoon
                        () {
                          setState(() {
                            vegetableLadel++;
                            vegetableTotal += 10;
                          });
                        },
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        status,
                        style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF36AE7C)),
                      ),
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
                        buildRowWithImages([
                          '${fruitTotal.toString()} g.\nผลไม้',
                          fruitPiece.toString(),
                          fruit.toString()
                        ],
                        () {
                          setState(() {
                            if (fruitPiece > 0) {
                            fruitPiece--;
                            fruitTotal = (fruitTotal - 5 >= 0) ? fruitTotal - 5 : 0;
                          }
                          });
                        },   // Minus Spoon
                        () {
                          setState(() {
                            fruitPiece++;
                            fruitTotal += 5;
                          });
                        },
                        () {
                          setState(() {
                            if (fruit > 0) {
                            fruit--;
                            fruitTotal = (fruitTotal - 10 >= 0) ? fruitTotal - 10 : 0;
                          }
                          });
                        },   // Minus Spoon
                        () {
                          setState(() {
                            fruit++;
                            fruitTotal += 10;
                          });
                        },
                    )],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    buildProgressBar(progressFruitValue),
                    const SizedBox(
                      height: 20,
                    ),
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
                        buildRowWithImages([
                          '${milkTotal.toString()} g.\nนม',
                          milkGrass.toString(),
                          milkCarton.toString()
                        ],
                        () {
                          setState(() {
                            if (milkGrass > 0) {
                            milkGrass--;
                            milkTotal = (milkTotal - 5 >= 0) ? milkTotal - 5 : 0;  // Ensure meatTotal is not negative
                          }
                          });
                        },   // Minus Spoon
                        () {
                          setState(() {
                            milkGrass++;
                            milkTotal += 5;
                          });
                        },  // Plus Spoon
                        () {
                          setState(() {
                            if (milkCarton > 0) {
                            milkCarton--;
                            milkTotal = (milkTotal - 10 >= 0) ? milkTotal - 10 : 0;
                          }
                          });
                        },   // Minus Spoon
                        () {
                          setState(() {
                            milkCarton++;
                            milkTotal += 10;
                          });
                        },
                    )],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    buildProgressBar(progressMilkValue),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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

TableRow buildRowWithImages(
    List<String> cells, 
  VoidCallback onMinusSpoon, VoidCallback onPlusSpoon, 
  VoidCallback onMinusLadle, VoidCallback onPlusLadle) {
  return TableRow(
    children: [
      buildTextCell(cells[0]),
      buildImageButtonCell(cells[1], onMinusSpoon, onPlusSpoon),
      buildImageButtonCell(cells[2], onMinusLadle, onPlusLadle),
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

Widget buildImageButtonCell(
    String text, VoidCallback onMinusPressed, VoidCallback onPlusPressed) {
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
                onPressed: onMinusPressed,
              ),
            ),
            Flexible(
              child: IconButton(
                icon: Image.asset('assets/plus_button.png'),
                iconSize: 40,
                onPressed: onPlusPressed,
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
