import 'package:flutter/material.dart';
import 'package:bestest_calculator/calculator_page/buttons_page.dart';
import 'package:bestest_calculator/calculator_page/result_page.dart';
import 'package:bestest_calculator/saved_data.dart';
class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});
  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  void _update(String calculatorInput) {
    setState(() {
      userInput = calculatorInput;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 38,
          child: ResultPage(input: userInput),
        ),
        Expanded(
          flex: 62,
          child: ButtonsPage(updateInput: _update),
        ),
      ],
    );
  }
}

