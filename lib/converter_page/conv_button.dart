import 'package:flutter/material.dart';
import 'package:bestest_calculator/eye_candy/ui_constants.dart';

/// A custom button for a calculator.
///
/// This is a stateless widget that creates a button with customizable properties.
/// The button can have different colors, text, text size, and border radius.
/// The button can also be of different types: 'default', 'wide', or 'tall'.
class ConverterBtn extends StatefulWidget {
  final Color? btnColor;
  final Color? textColor;
  final dynamic btnDisplay;   /// The text or icon to be displayed on the button.
  final double textSize;
  final String btnType;       /// The type of the button: 'default', 'wide', or 'tall'.
  final BorderRadius borderRadius;
  final ValueChanged<String> btnPressed;
  final int flexVal;

  /// Creates a [ConverterBtn].
  const ConverterBtn({
    super.key,
    this.btnColor,
    this.btnType = 'default',
    this.textColor = BlueWhite,
    required this.btnDisplay,
    required this.btnPressed,
    this.textSize = 28,
    this.flexVal = 1,
    this.borderRadius = const BorderRadius.all(Radius.circular(0)), /// By default the button has no rounded corners
  });

  @override
  State<ConverterBtn> createState() => _ConverterBtnState();
}

class _ConverterBtnState extends State<ConverterBtn> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.flexVal,
      child: Padding(
        padding: const EdgeInsets.only(left: 2, right: 2),
        child: SizedBox(
          height: btnHeight(context),
          child: ElevatedButton(
              onPressed: () {
                widget.btnPressed(widget.btnDisplay.toString());
              },
              style: ButtonStyle(
                backgroundColor: getColor(),//MaterialStateProperty.all<Color>(widget.btnColor!),
                splashFactory: NoSplash.splashFactory,
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: widget.borderRadius,
                  ),
                ),
              ),
              child: btnCover()
          ),
        ),
      ),
    );
  }

  MaterialStateProperty<Color> getColor() {
    getColor(Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return widget.btnColor!.withOpacity(0.5);
      } else {
        return widget.btnColor!;
      }
    }
    return MaterialStateProperty.resolveWith(getColor);
  }

  /// Returns the height of the button based on its type.
  double btnHeight(BuildContext context) {
    if (widget.btnType == 'tall') {
      return screenHeight(context) * 0.2 + 5;
    }
    return screenHeight(context) * 0.1;
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


