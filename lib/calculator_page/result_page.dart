import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bestest_calculator/eye_candy/ui_constants.dart';
import 'package:flutter/widgets.dart';

class ResultPage extends StatefulWidget {
  final String input;
  final String lastCalc;
   const ResultPage({
     super.key,
     required this.input,
     required this.lastCalc
   });

  @override
  State<ResultPage> createState() {
    return ResultPageState();
  }
}

class ResultPageState extends State<ResultPage> {
  double _fontMultiplier()  {
    if (widget.input.length > 6 && widget.input.length < 20) {
      return 0.15 * (5 / widget.input.length);
    } else if (widget.input.length >= 20) {
      return 0.15 * (5 / 20);
    }
    return 0.12;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              widget.lastCalc,
              style: TextStyle(
                color: Colors.white54,
                fontSize: screenHeight(context) * 0.03,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              widget.input,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenHeight(context) * _fontMultiplier(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


