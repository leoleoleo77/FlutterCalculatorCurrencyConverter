import 'package:flutter/material.dart';
import 'package:bestest_calculator/eye_candy/ui_constants.dart';
import 'package:bestest_calculator/converter_page/conv_buttons_page.dart';
import 'package:bestest_calculator/converter_page/api_model/api_services.dart';
import 'package:bestest_calculator/converter_page/api_model/rates_model.dart';
import 'package:bestest_calculator/converter_page/conv_out_page.dart';
import 'package:bestest_calculator/saved_data.dart';
import 'package:bestest_calculator/converter_page/input_function.dart';

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

  Future<void> _fetchData() async {
    ratesModel = fetchRates();
    currenciesModel = fetchCurrencies();
  }

  String convOutRaw = convOut1;
  String convOutProcessed = convOut2;
  void _update(String userInput) {
    setState(() {
      convOutRaw = HandleInput(userInput);
      convOutProcessed = GiveOut(userInput);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 38,
          child: FutureBuilder<RatesModel>(
            future: ratesModel,
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
                              fontSize: 20,
                            ),
                          ),
                        );
                      } else {
                        ratesGlobal = snapshot.data!.rates;
                        return ConversionOutputPage(
                          userInput: convOutRaw,
                          convOutput: convOutProcessed,
                          currencies: index.data!,
                          //rates: snapshot.data!.rates,
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
