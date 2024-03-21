import 'package:flutter/material.dart';
import 'package:bestest_calculator/calculator_page/calc_buttons_page.dart';
import 'package:bestest_calculator/calculator_page/result_page.dart';
import 'package:bestest_calculator/general/saved_data.dart';
import 'package:bestest_calculator/general/io_functions.dart';
class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});
  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {

   /// These are used as a pipeline to pass data between the buttons and the result display
  String calcDisplay = calcOut;
  String s_calcDisplay = lastCalcOut;
  void _update(String userInput) {
    setState(() {
      calcDisplay = handleCalcInput(userInput);
      s_calcDisplay = lastCalcOut;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 38,
          child: ResultPage(input: calcDisplay, lastCalc: s_calcDisplay),
        ),
        Expanded(
          flex: 62,
          child: ButtonsPage(updateInput: _update),
        ),
      ],
    );
  }
}

