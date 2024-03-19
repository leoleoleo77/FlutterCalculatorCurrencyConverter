import 'package:flutter/material.dart';
import 'package:bestest_calculator/converter_page/conv_button.dart';
import 'package:bestest_calculator/eye_candy/ui_constants.dart';

/// A page containing the layout for the converter buttons.
class ButtonsPage extends StatefulWidget {
  final ValueChanged<String> updateInput;
  const ButtonsPage({
    super.key,
    required this.updateInput,
  });

  @override
  ButtonsPageState createState() => ButtonsPageState();
}

class ButtonsPageState extends State<ButtonsPage> {
  @override
  Widget build(BuildContext context) {
    // The main layout of the page is a column of rows, each containing calculator buttons.
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Expanded(
            flex: 200,
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Row(
                children: [
                  ConverterBtn(
                    btnDisplay: 'Convert',
                    textSize: 25,
                    btnPressed: widget.updateInput,
                    btnColor: ActiveBlue,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            flex: 195,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ConverterBtn(
                  btnDisplay: '7',
                  btnPressed: widget.updateInput,
                  btnColor: NumberGray,
                ),
                ConverterBtn(
                  btnDisplay: '8',
                  btnPressed: widget.updateInput,
                  btnColor: NumberGray,
                ),
                ConverterBtn(
                  btnDisplay: '9',
                  btnPressed: widget.updateInput,
                  btnColor: NumberGray,
                ),
                ConverterBtn(
                  btnDisplay: Icons.backspace_outlined,
                  textSize: 25,
                  btnPressed: widget.updateInput,
                  btnColor: BoringLightGray,
                ),
              ],
            ),
          ),
          // The fourth and fifth row of buttons: '1', '2', '3', '0', '.', and '='.
          Expanded(
            flex: 195,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ConverterBtn(
                  btnDisplay: '4',
                  textSize: 25,
                  btnPressed: widget.updateInput,
                  btnColor: NumberGray,
                ),
                ConverterBtn(
                  btnDisplay: '5',
                  textSize: 25,
                  btnPressed: widget.updateInput,
                  btnColor: NumberGray,
                ),
                ConverterBtn(
                  btnDisplay: '6',
                  textSize: 25,
                  btnPressed: widget.updateInput,
                  btnColor: NumberGray,
                ),
                ConverterBtn(
                  btnDisplay: 'AC',
                  textSize: 25,
                  btnPressed: widget.updateInput,
                  btnColor: BoringLightGray,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 400,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ConverterBtn(
                            btnDisplay: '1',
                            btnPressed: widget.updateInput,
                            btnColor: NumberGray,
                          ),
                          ConverterBtn(
                            btnDisplay: '2',
                            btnPressed: widget.updateInput,
                            btnColor: NumberGray,
                          ),
                          ConverterBtn(
                            btnDisplay: '3',
                            btnPressed: widget.updateInput,
                            btnColor: NumberGray,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ConverterBtn(
                            btnDisplay: '0',
                            btnPressed: widget.updateInput,
                            btnColor: NumberGray,
                            flexVal: 2,
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(8)
                            ),
                          ),
                          ConverterBtn(
                            btnDisplay: '.',
                            btnPressed: widget.updateInput,
                            btnColor: NumberGray,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ConverterBtn(
                    btnDisplay: Icons.swap_vert,
                    btnPressed: widget.updateInput,
                    textSize: 40,
                    btnColor: BoringLightGray,
                    btnType: 'tall',
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(8)
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
