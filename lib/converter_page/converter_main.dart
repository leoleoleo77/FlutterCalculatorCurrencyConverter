import 'package:flutter/material.dart';
import 'package:bestest_calculator/eye_candy/ui_constants.dart';
class ConverterPage extends StatelessWidget {
  const ConverterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MidnightGray,
      child: const Center(
        child: Text(
          'Converter Page',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}