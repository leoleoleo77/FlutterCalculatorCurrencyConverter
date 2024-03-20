import 'package:bestest_calculator/saved_data.dart';
import 'package:bestest_calculator/calculator_page/calculate_function.dart';
String HandleInput(String input) {
  if (isNumeric(input)) {
    convOut1 += input;
    return convOut1;
  } else if (input == '.') {
    if (isLastNumberInt(convOut1)) {
      if (!isLastCharNumeric(convOut1)) {
        convOut1 += '0';
      }
      convOut1 += input;
      return convOut1;
    }
  } else if (input == 'IconData(U+0EEB5)') {
    convOut1 = removeLastChar(convOut1);
    return convOut1;
  } else if (input == 'IconData(U+0E627)') {
    String temp = ddValue1;
    ddValue1 = ddValue2;
    ddValue2 = temp;

    if (convOut1 != '' && convOut2 != '') {
      convOut2 = _convert();
    }

    return convOut1;
  } else if (input == 'AC') {
    convOut1 = '';
    convOut2 = '';
    return convOut1;
  }
  return convOut1;
}

String GiveOut(String input) {
  if (input == 'Convert') {
    return _convert();
  }
  return convOut2;
}

String _convert() {
  String amount = convOut1;
  Map exchangeRates = ratesGlobal;
  String currencyBase = ddValue1;
  String currencyFinal = ddValue2;

  double usdAmount = double.parse(amount) / exchangeRates[currencyBase];

  String output = (usdAmount * exchangeRates[currencyFinal]).toStringAsFixed(4);
  convOut2 = output;
  return output;
}

