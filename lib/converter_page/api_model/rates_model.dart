import 'dart:convert';

class RatesModel {
  RatesModel({
    required this.disclaimer,
    required this.license,
    required this.timestamp,
    required this.base,
    required this.rates,
  });

  String disclaimer;
  String license;
  int timestamp;
  String base;
  Map<String, double> rates;

  /// Creates a new instance of `RatesModel` from a map.
  ///
  /// This factory constructor allows for creating a `RatesModel` instance from dynamic data.
  factory RatesModel.fromJson(Map<String, dynamic> json) {
    return RatesModel(
    disclaimer: json["disclaimer"],
    license: json["license"],
    timestamp: json["timestamp"],
    base: json["base"],
    rates: Map.from(json["rates"]).map((k, v) {
      return MapEntry<String, double>(k, v.toDouble());
    }),
  );
  }

  /// Converts the `RatesModel` instance into a map.
  Map<String, dynamic> toJson() => {
    "disclaimer": disclaimer,
    "license": license,
    "timestamp": timestamp,
    "base": base,
    "rates": Map.from(rates).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}

/// Converts a JSON string to a `RatesModel` instance.
RatesModel ratesModelFromJson(String str) {
  return RatesModel.fromJson(json.decode(str));
}

/// Converts a `RatesModel` instance to a JSON string.
String ratesModelToJson(RatesModel data) {
  return json.encode(data.toJson());
}