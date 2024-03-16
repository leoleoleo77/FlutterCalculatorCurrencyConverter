import 'package:flutter/material.dart';
import 'package:bestest_calculator/converter_page/converter_main.dart';
class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});
  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConverterPage()),
                );
              },
              child: const Text('Go to second screen'),
            ),
          ],
        ),
      );
  }
}

