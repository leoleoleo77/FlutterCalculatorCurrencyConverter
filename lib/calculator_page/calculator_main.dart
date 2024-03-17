import 'package:flutter/material.dart';
import 'package:bestest_calculator/calculator_page/buttons_page.dart';
class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});
  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 35,
          child: Container(
            color: Colors.blue,
          ),
        ),
        const Expanded(
          flex: 65,
          child: ButtonsPage(),
        ),
      ],
    );
  }
}

