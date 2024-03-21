import 'package:flutter/material.dart';
import 'package:bestest_calculator/general/ui_constants.dart';
import 'package:bestest_calculator/converter_page/conv_buttons_page.dart';
import 'package:bestest_calculator/converter_page/api_model/api_services.dart';
import 'package:bestest_calculator/converter_page/api_model/rates_model.dart';
import 'package:bestest_calculator/converter_page/conv_out_page.dart';
import 'package:bestest_calculator/general/saved_data.dart';
import 'package:bestest_calculator/general/io_functions.dart';

/// This is the main page for the conversion feature of the application.
/// It fetches the currency rates and currencies from an API and displays the conversion output.
class ConversionPage extends StatefulWidget {
  const ConversionPage({
    super.key,
  });

  @override
  ConversionPageState createState() => ConversionPageState();
}

class ConversionPageState extends State<ConversionPage> {
  late Future<RatesModel> ratesModel;
  late Future<Map> currenciesModel;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  /// Fetches the currency rates and currencies from the API.
  Future<void> _fetchData() async {
    ratesModel = fetchRates();
    currenciesModel = fetchCurrencies();
  }

  /// These are used as a pipeline to pass the user input to the conversion functions
  String convOutRaw = convOut1;
  String convOutProcessed = convOut2;

  /// Updates the conversion output based on the user input.
  void _update(String userInput) {
    setState(() {
      convOutRaw = handleConvInput(userInput);
      convOutProcessed = giveConvOut(userInput);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 38,
          /// FutureBuilder is a widget in Flutter that returns another widget based on the latest snapshot of interaction with a Future.
          /// It's used to create a widget based on the state of a Future (which represents a computation that might not have completed yet)
          child: FutureBuilder<RatesModel>(
            future: ratesModel,
            /// The builder function in Flutter's FutureBuilder widget takes two parameters: BuildContext and AsyncSnapshot.
            ///  I. BuildContext context: This is a handle to the location of the widget in the widget tree.
            ///     This context can be used to find other widgets up the tree, such as the nearest Theme.
            ///     It's a standard parameter in many Flutter widget builder methods.
            /// II. AsyncSnapshot snapshot: This is an immutable representation of the most recent interaction with a Future.
            ///     The snapshot provides information about the state of the future computation,
            ///     such as whether it's still loading (snapshot.connectionState == ConnectionState.waiting),
            ///     if it's completed (snapshot.connectionState == ConnectionState.done), and if it has data (snapshot.hasData).
            ///     If the future completed with an error, snapshot.error will contain that error.
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: ActiveBlue,
                  ),
                );
              } else {
                return FutureBuilder<Map>(
                    future: currenciesModel,
                    builder: (context, index) {
                      if (index.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: ActiveBlue,
                          ),
                        );
                      } else if (index.hasError) {
                        return Center(
                          child: Text(
                            'Error: ${index.error}',
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 10,
                            ),
                          ),
                        );
                      } else {
                        ratesGlobal = snapshot.data!.rates;
                        return ConversionOutputPage(
                          userInput: convOutRaw,
                          convOutput: convOutProcessed,
                          currencies: index.data!,
                          dropdownValue1: ddValue1,
                          dropdownValue2: ddValue2,
                        );
                      }
                    });
              }
            },
          ),
        ),
        Expanded(
          flex: 62,
          child: ButtonsPage(updateInput: _update),
        ),
      ],
    );
  }
}
