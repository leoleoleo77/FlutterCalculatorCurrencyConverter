import 'package:bestest_calculator/eye_candy/ui_constants.dart';
import 'package:bestest_calculator/saved_data.dart';
import 'package:flutter/material.dart';
import 'package:bestest_calculator/converter_page/currencies_menu.dart';

class ConversionOutputPage extends StatefulWidget {
  final String userInput;
  final String convOutput;
  final Map currencies;
  String dropdownValue1;
  String dropdownValue2;
   ConversionOutputPage({
    super.key,
    required this.userInput,
    required this.convOutput,
    required this.currencies,
    required this.dropdownValue1,
    required this.dropdownValue2,
  });

  @override
  ConversionOutputPageState createState() => ConversionOutputPageState();
}

class ConversionOutputPageState extends State<ConversionOutputPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Spacer(flex: 20),
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
                        child: Text(widget.userInput,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                        ),
                      ),
                      const Divider(
                        color: BlueWhite,
                        thickness: 0.5,
                      )
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: CurrenciesMenu(
                      value: widget.dropdownValue1,
                      currencies: widget.currencies,
                      onChanged: (String? newValue) {
                        setState(() {
                          widget.dropdownValue1 = newValue!;
                          ddValue1 = newValue;
                        });
                      },
                    )
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
                        child: Text(widget.convOutput,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      const Divider(
                        color: BoringLightGray,
                        thickness: 2,
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: CurrenciesMenu(
                      value: widget.dropdownValue2,
                      currencies: widget.currencies,
                      onChanged: (String? newValue) {
                        setState(() {
                          widget.dropdownValue2 = newValue!;
                          ddValue2 = newValue;
                        });
                      },
                    )
                ),
              ],
            ),
          ),
          const Spacer(flex: 15),
        ],
      ),
    );
  }
}
