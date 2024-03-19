import 'package:flutter/material.dart';
import 'package:bestest_calculator/converter_page/conv_buttons_page.dart';
import 'package:bestest_calculator/converter_page/conv_out_page.dart';

class ConversionPage extends StatefulWidget {

  //final rates;
  //final Map currencies;

  const ConversionPage({
    super.key,
    //required this.rates,
    //required this.currencies,
  });

  @override
  ConversionPageState createState() => ConversionPageState();
}

class ConversionPageState extends State<ConversionPage> {
  void _update(String userInput) {
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 38,
          child: ConversionOutputPage(),
        ),
        Expanded(
          flex: 62,
          child: ButtonsPage(updateInput: _update),
        ),
      ],
    );
  }
}
