import 'package:http/http.dart' as http;
import 'package:bestest_calculator/converter_page/api_model/api_urls.dart';
import 'package:bestest_calculator/converter_page/api_model/data_formatting.dart';
import 'package:bestest_calculator/converter_page/api_model/rates_model.dart';

/// The fetchRates function makes a GET request.
/// It uses the http.get method from the http package to send the request,
/// and Uri.parse to convert the URL string to a Uri object.
///
/// Once the response is received, the body of the response, which is a JSON string,
/// is passed to the ratesModelFromJson function.
/// This function converts the JSON string to an instance of RatesModel,
/// a custom class that represents the data structure of the response.
Future<RatesModel> fetchRates() async {
  var response = await http.get(Uri.parse(AppUrl.ratesUrl));
  final ratesModel = ratesModelFromJson(response.body);
  return ratesModel;
}

/// The fetchCurrencies function works in a similar way.
/// It makes a GET request to the URL,
/// and converts the JSON response body to a Map using the allCurrenciesFromJson function.
Future<Map> fetchCurrencies() async {
  var response = await http.get(Uri.parse(AppUrl.currenciesUrl));
  final allCurrencies = allCurrenciesFromJson(response.body);
  return allCurrencies;
}