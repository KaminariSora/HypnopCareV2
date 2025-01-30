import 'package:flutter/material.dart';

class Page3Healthdiet extends StatelessWidget {
  const Page3Healthdiet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Diet",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFFFFF),
              )),
          centerTitle: true,
          backgroundColor:
              const Color(0xFF5E7F60), // Change to your preferred color
          elevation: 4),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [BoxShadow(blurRadius: 20)]),
          child: Table(
            columnWidths: const {
              0: FlexColumnWidth(),
              1: FlexColumnWidth(),
              2: FlexColumnWidth(),
            },
            border: TableBorder.all(),
            children: [
              buildRow(['', 'ซ้อน', 'ทัพพี'], isHeader: true),
              buildRowWithImages(['0 g.\nเนื้อสัตว์', '0', '0']),
              buildRowWithImages(['0 g.\nเนื้อสัตว์', '0', '0']),
              buildRowWithImages(['0 g.\nเนื้อสัตว์', '0', '0']),
            ],
          ),
        ),
      ),
    );
  }
}

TableRow buildRow(List<String> cells, {bool isHeader = false}) {
  return TableRow(
    children: cells.map((cell) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            cell,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            ),
          ),
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
      buildImageButtonCell(cells[1]),
    ],
  );
}

Widget buildTextCell(String text) {
  return Padding(
    padding: EdgeInsets.all(8.0),
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
    padding: EdgeInsets.all(8.0),
    child: Column(
      children: [
        Text("0"),
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