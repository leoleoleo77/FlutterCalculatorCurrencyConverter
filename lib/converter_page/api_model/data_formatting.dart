import 'dart:convert';

/// These two functions are used for converting data between JSON and Dart Map formats.
///
/// The allCurrenciesFromJson function takes a JSON string as an argument and converts it into a Dart Map.
/// It uses the json.decode(str) function to decode the JSON string into a dynamic Map.
/// Then, it uses the Map.from() function to create a new Map from the decoded JSON.
/// The map() function is used to iterate over each key-value pair in the Map and return a new MapEntry.
/// The result is a Map where both keys and values are Strings.
Map<String, String> allCurrenciesFromJson(String str) {
  return Map.from(json.decode(str)).map((k, v) {
    return MapEntry<String, String>(k, v);
  });
}

/// The allCurrenciesToJson function does the opposite.
/// It takes a Dart Map as an argument and converts it into a JSON string.
/// It uses the Map.from(data) function to create a new Map from the input data.
/// The map() function is used to iterate over each key-value pair in the Map and return a new MapEntry.
/// The json.encode() function is then used to encode the Map into a JSON string.
String allCurrenciesToJson(Map<String, String> data) {
  return json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v)));
}