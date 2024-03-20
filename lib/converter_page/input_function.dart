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
    return convOut1;
  } else if (input == 'AC') {
    convOut1 = '';
    return convOut1;
  } else if (input == 'Convert') {
    convOut2 = convOut1;
    return convOut1;
  }
  return input;
}

