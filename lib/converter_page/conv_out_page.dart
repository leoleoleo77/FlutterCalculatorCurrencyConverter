import 'package:bestest_calculator/eye_candy/ui_constants.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:bestest_calculator/converter_page/currencies_menu.dart';

class ConversionOutputPage extends StatefulWidget {
  const ConversionOutputPage({super.key});

  @override
  ConversionOutputPageState createState() => ConversionOutputPageState();
}

class ConversionOutputPageState extends State<ConversionOutputPage> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Spacer(flex: 20),
          Expanded(
            flex: 20,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Hello world",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                        ),
                      ),
                      DottedLine(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.center,
                        dashColor: BlueWhite,
                        lineThickness: 1,
                        dashLength: 2,
                      )
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: CurrenciesMenu()
                ),
              ],
            ),
          ),
          Expanded(
            flex: 20,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Hello world",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      DottedLine(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.center,
                        dashColor: BoringLightGray,
                        lineThickness: 2,
                        dashLength: 2,
                      )
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: CurrenciesMenu()
                ),
              ],
            ),
          ),
          Spacer(flex: 15),
        ],
      ),
    );
  }
}
