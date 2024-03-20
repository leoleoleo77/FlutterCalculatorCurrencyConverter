import 'package:flutter/material.dart';
import 'package:bestest_calculator/eye_candy/ui_constants.dart';
import 'package:bestest_calculator/converter_page/api_model/rates_model.dart';
import 'package:bestest_calculator/converter_page/api_model/api_services.dart';
import 'package:bestest_calculator/converter_page/converter_main.dart';

class Connector extends StatefulWidget {
  const Connector({super.key});

  @override
  State<Connector> createState() => _ConnectorState();
}

class _ConnectorState extends State<Connector> {
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

  ///FutureBuilder is a widget in Flutter that returns another widget based on the latest snapshot of interaction with a Future.
  ///It's used to create a widget based on the state of a Future (which represents a computation that might not have completed yet)
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RatesModel>(
        future: ratesModel,
        builder: ( context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(
              color: ActiveBlue,
              ),
            );
          } else {
            return FutureBuilder<Map>(
                future: currenciesModel,
                builder: (context, index){
                  if (index.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: ActiveBlue,
                      ),
                    );
                  } else if (index.hasError) {
                    return Center(
                        child: Text('Error: ${index.error}',
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                          ),
                        ),
                    );
                  } else {
                    return ConversionPage(
                      rates: snapshot.data!.rates,
                      currencies: index.data!,
                    );
                  }
                }
            );
          }
        },
    );
  }
}