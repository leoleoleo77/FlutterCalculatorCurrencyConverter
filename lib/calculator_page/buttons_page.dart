import 'package:flutter/material.dart';
import 'package:bestest_calculator/calculator_page/my_buttons.dart';
import 'package:bestest_calculator/eye_candy/ui_constants.dart';

class ButtonsPage extends StatefulWidget {
  const ButtonsPage({super.key});

  @override
  ButtonsPageState createState() => ButtonsPageState();
}

class ButtonsPageState extends State<ButtonsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          flex: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorBtn(text: 'C', btnColor: BoringLightGray),
              CalculatorBtn(text: 'C', btnColor: BoringLightGray),
              CalculatorBtn(text: 'C', btnColor: BoringLightGray),
              CalculatorBtn(text: 'C', btnColor: BoringLightGray),
              CalculatorBtn(text: 'C', btnColor: ActiveBlue),
            ],
          ),
        ),
        Expanded(
          flex: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Colors.green,
                height: 50,
                width: 50,
              ),
              Container(
                color: Colors.red,
                height: 50,
                width: 50,
              ),
              Container(
                color: Colors.green,
                height: 50,
                width: 50,
              ),
              Container(
                color: Colors.red,
                height: 50,
                width: 50,
              ),
              Container(
                color: Colors.green,
                height: 50,
                width: 50,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Colors.green,
                height: 50,
                width: 50,
              ),
              Container(
                color: Colors.red,
                height: 50,
                width: 50,
              ),
              Container(
                color: Colors.green,
                height: 50,
                width: 50,
              ),
              Container(
                color: Colors.red,
                height: 50,
                width: 50,
              ),
              Container(
                color: Colors.green,
                height: 50,
                width: 50,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          color: Colors.green,
                          height: 50,
                          width: 50,
                        ),
                        Container(
                          color: Colors.red,
                          height: 50,
                          width: 50,
                        ),
                        Container(
                          color: Colors.green,
                          height: 50,
                          width: 50,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            color: Colors.red,
                            height: 50,
                            width: 50,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.green,
                            height: 50,
                            width: 50,
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 25,
                child: Container(
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
