import 'package:flutter/material.dart';
import 'package:bestest_calculator/eye_candy/ui_constants.dart';

/// A custom button for a calculator.
///
/// This is a stateless widget that creates a button with customizable properties.
/// The button can have different colors, text, text size, and border radius.
/// The button can also be of different types: 'default', 'wide', or 'tall'.
class CalculatorBtn extends StatefulWidget {
  final Color? btnColor;
  final Color? textColor;
  final dynamic btnDisplay;   /// The text or icon to be displayed on the button.
  final double textSize;
  final String btnType;       /// The type of the button: 'default', 'wide', or 'tall'.
  final BorderRadius borderRadius;
  final ValueChanged<String> btnPressed;

  /// Creates a [CalculatorBtn].
  const CalculatorBtn({
    super.key,
    this.btnColor,
    this.btnType = 'default',
    this.textColor = Colors.white,
    required this.btnDisplay,
    required this.btnPressed,
    this.textSize = 28,
    this.borderRadius = const BorderRadius.all(Radius.circular(0)), /// By default the button has no rounded corners
  });

  @override
  State<CalculatorBtn> createState() => _CalculatorBtnState();
}

class _CalculatorBtnState extends State<CalculatorBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: btnWidth(context),
      height: btnHeight(context),
      decoration: BoxDecoration(
          color: widget.btnColor,
          borderRadius: widget.borderRadius
      ),
      child: TextButton(
          onPressed: () => widget.btnPressed(widget.btnDisplay.toString().substring(0, 1)),
          style: TextButton.styleFrom(
            textStyle: const TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
          child: Center(
              child: btnCover()
          )
      ),
    );
  }

  /// Returns the width of the button based on its type.
  double btnWidth(BuildContext context) {
    if (widget.btnType == 'wide') {
      return screenWidth(context) * 0.46 + 5;
    }
    return screenWidth(context) * 0.23;
  }

  /// Returns the height of the button based on its type.
  double btnHeight(BuildContext context) {
    if (widget.btnType == 'tall') {
      return screenHeight(context) * 0.20 + 5;
    }
    return screenHeight(context) * 0.10;
  }

  /// Returns the text or icon to be displayed on the button.
  Widget btnCover() {
    if (widget.btnDisplay is String) {
      return Text(widget.btnDisplay,
        style: TextStyle(
          color: widget.textColor,
          fontSize: widget.textSize,
        ),
      );
    } else {
      return Icon(widget.btnDisplay,
        color: widget.textColor,
        size: widget.textSize,);
    }
  }
}


