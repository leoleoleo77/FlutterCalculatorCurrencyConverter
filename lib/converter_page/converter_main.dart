import 'package:flutter/material.dart';
import 'package:bestest_calculator/converter_page/conv_buttons_page.dart';
import 'package:bestest_calculator/converter_page/conv_out_page.dart';
import 'package:bestest_calculator/saved_data.dart';
import 'package:bestest_calculator/converter_page/input_function.dart';

class ConversionPage extends StatefulWidget {

  final rates;
  final Map currencies;

  const ConversionPage({
    super.key,
    required this.rates,
    required this.currencies,
  });

  @override
  ConversionPageState createState() => ConversionPageState();
}

class ConversionPageState extends State<ConversionPage> {

  String convOutRaw = convOut1;
  String convOutProcessed = convOut2;
  void _update(String userInput) {
    setState(() {
      convOutRaw = HandleInput(userInput);
      convOutProcessed = convOut2;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 38,
          child: ConversionOutputPage(
              userInput: convOutRaw,
              convOutput: convOutProcessed,
              currencies: widget.currencies,
              dropdownValue1: ddValue1,
              dropdownValue2: ddValue2,
          ),
        ),
        Expanded(
          flex: 62,
          child: ButtonsPage(updateInput: _update),
        ),
      ],
    );
  }
}
