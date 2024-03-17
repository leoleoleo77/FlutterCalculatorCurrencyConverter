import 'package:flutter/material.dart';

class CalculatorBtn extends StatelessWidget {
  final Color? btnColor;
  final Color? textColor;
  final String text;
  final double? textSize;
  //final Function onPress;
  final String btnType;

  const CalculatorBtn({
    super.key,
    this.btnColor,
    this.btnType = 'default',
    this.textColor = Colors.black,
    required this.text,
    //required this.onPress,
    this.textSize = 28,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: btnColor,
      child: TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: () {},
          child: Text(text),
      ),
    );
  }
}
