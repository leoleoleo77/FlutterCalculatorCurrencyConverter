import 'package:flutter/material.dart';
import 'package:bestest_calculator/general/ui_constants.dart';
import 'package:bestest_calculator/general/my_button.dart';

/// A page containing the layout for the calculator buttons.
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

          // The first row of buttons: 'C', '÷', '×', and backspace.
          Expanded(
            flex: 195,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomBtn(
                    btnDisplay: 'C',
                    textSize: 25,
                    btnPressed: widget.updateInput,
                    btnColor: BoringLightGray,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8)
                    ),
                ),
                CustomBtn(
                    btnDisplay: '÷',
                    textSize: 35,
                    btnPressed: widget.updateInput,
                    btnColor: BoringLightGray,
                ),
                CustomBtn(
                    btnDisplay: '×',
                    textSize: 40,
                    btnPressed: widget.updateInput,
                    btnColor: BoringLightGray,
                ),
                CustomBtn(
                  btnDisplay: Icons.backspace_outlined,
                  textSize: 25,
                  btnPressed: widget.updateInput,
                  btnColor: BoringLightGray,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8)
                  ),
                ),
              ],
            ),
          ),

          // The second row of buttons: '7', '8', '9', and '−'.
          Expanded(
            flex: 195,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomBtn(
                  btnDisplay: '7',
                  btnPressed: widget.updateInput,
                  btnColor: NumberGray,
                ),
                CustomBtn(
                  btnDisplay: '8',
                  btnPressed: widget.updateInput,
                  btnColor: NumberGray,
                ),
                CustomBtn(
                    btnDisplay: '9',
                    btnPressed: widget.updateInput,
                    btnColor: NumberGray,
                ),
                CustomBtn(
                  btnDisplay: '−',
                  textSize: 40,
                  btnPressed: widget.updateInput,
                  btnColor: BoringLightGray,
                ),
              ],
            ),
          ),

          // The third row of buttons: '4', '5', '6', and '+'.
          Expanded(
            flex: 195,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomBtn(
                  btnDisplay: '4',
                  btnPressed: widget.updateInput,
                  btnColor: NumberGray,
                ),
                CustomBtn(
                  btnDisplay: '5',
                  btnPressed: widget.updateInput,
                  btnColor: NumberGray,
                ),
                CustomBtn(
                    btnDisplay: '6',
                    btnPressed: widget.updateInput,
                    btnColor: NumberGray,
                ),
                CustomBtn(
                  btnDisplay: '+',
                  textSize: 40,
                  btnPressed: widget.updateInput,
                  btnColor: BoringLightGray,
                ),
              ],
            ),
          ),

          // The fourth and fifth row of buttons: '1', '2', '3', '0', '.', and '='.
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
                          CustomBtn(
                            btnDisplay: '1',
                            btnPressed: widget.updateInput,
                            btnColor: NumberGray,
                          ),
                          CustomBtn(
                            btnDisplay: '2',
                            btnPressed: widget.updateInput,
                            btnColor: NumberGray,
                          ),
                          CustomBtn(
                              btnDisplay: '3',
                              btnPressed: widget.updateInput,
                              btnColor: NumberGray,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomBtn(
                              btnDisplay: '0',
                              btnPressed: widget.updateInput,
                              btnColor: NumberGray,
                              flexVal: 2,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(8)
                              ),
                          ),
                          CustomBtn(
                              btnDisplay: '.',
                              btnPressed: widget.updateInput,
                              btnColor: NumberGray,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                CustomBtn(
                  btnDisplay: '=',
                  btnPressed: widget.updateInput,
                  textSize: 40,
                  btnColor: ActiveBlue,
                  btnType: 'tall',
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(8)
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
