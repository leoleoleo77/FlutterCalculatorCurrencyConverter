import 'package:bestest_calculator/api_model/key.dart';

class AppUrl {
  static const String baseUrl = 'https://openexchangerates.org/api/';

  /// Get a JSON list of all currency symbols available from the Open Exchange Rates API, along with their full names, for use in your integration.
  ///
  /// This list will always mirror the currencies available in the latest rates (given as their 3-letter codes).
  static const String currenciesUrl = '${baseUrl}currencies.json?app_id=$key';

  /// Get the latest exchange rates available from the Open Exchange Rates API.
  ///
  /// The most simple route in our API, latest.json provides a standard response object containing all the conversion rates for all of the currently
  /// available symbols/currencies, labeled by their international-standard 3-letter ISO currency codes.
  static const String ratesUrl = '${baseUrl}latest.json?base=USD&app_id=$key';
}