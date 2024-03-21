import 'package:bestest_calculator/general/saved_data.dart';
import 'package:math_expressions/math_expressions.dart';


/// This function takes a string input and returns a string result.
/// The input is expected to be a number, a mathematical expression or a command.
/// The function handles the following commands:
/// 'I' - remove the last character from the output
/// 'C' - clear the output
/// '+', '−', '÷', '×', '.' - add the operator to the output if the last character is numeric
/// '=' - evaluate the mathematical expression in the output
String handleCalcInput(String input) {

  /// If the input is a number, simply add it to the output.
  /// There is never a case when a number input is not added to the output.
  if (_isNumeric(input)) {
    calcOut += input;
    return calcOut;

  /// If the input is 'IconData(U+0EEB5)', remove the last character from the output.
  /// The _removeLastChar() function checks if the output is empty before removing the last character.
  /// So there is no need to do it here.
  } else if (input == 'IconData(U+0EEB5)') {
    calcOut = _removeLastChar(calcOut);
    return calcOut;

  /// If the input is 'C', clear the output as well as the "last calculation" output.
  } else if (input == 'C') {
    calcOut = '';
    lastCalcOut = '';
    return calcOut;

  /// If the input is '+' there are three cases.
  /// 1. The last character is numeric, in which case the operator is simply added to the output.
  /// 2. The last character is '−', in which case the operator is replaced with '+'.
  ///    This was done to avoid inputs like '2−+3' which could be calculated by the parser but are unnecessary.
  /// 3. If the last character is anything other than a number or '-' then the input is simply ignored.
  } else if (input == '+') {
    if (_isLastCharNumeric(calcOut)) {
      calcOut += input;
      return calcOut;
    } else if (_getLastChar(calcOut) == '−') {
      calcOut = _replaceLastChar(calcOut, input);
      return calcOut;
    }

  /// Likewise, the '-' operator has three similar cases.
  /// 1. The last character is '-', in which case the input is ignored.
  /// 2. The last character is '+', in which case the operator is replaced with '-'.
  /// 3. The last character is anything but '-', '+' in which case the operator is added to the output.
  ///
  /// This allows for multiplications/divisions with negative numbers like '2×−3' or '2÷−3'.
  /// Also it allows for a negative number to be at the start of the calculation like '−2+3'.
  } else if (input == '−') {
    if (_isLastCharNumeric(calcOut) || _getLastChar(calcOut) == '×' || _getLastChar(calcOut) == '÷' || _getLastChar(calcOut) == '') {
      calcOut += input;
      return calcOut;
    } else if (_getLastChar(calcOut) == '+') {
      calcOut = _replaceLastChar(calcOut, input);
      return calcOut;
    }

  /// The '×' and '÷' operators have a similar case.
  /// If the last character is numeric, the operator is added to the output.
  /// Otherwise nothing is done.
  } else if (input == '×' || input == '÷') {
    if (_isLastCharNumeric(calcOut)) {
      calcOut += input;
      return calcOut;
    }

  /// The '.' operator is a funny one.
  /// Firstly, using the _isLastNumberInt() function, we check if the last number in the output is an integer.
  /// Meaning we check if the last number already has a decimal point or not.
  /// In the case that is has, the input is ignored.
  /// In the case that it doesn't, there are two cases.
  ///  1. The last character is an integer, in which case the decimal point is added to the output.
  ///  2. The last character is an operator or the void (''), in which case a '0' is added before the decimal point.
  ///     This is done to avoid ugly outputs like '2+.3', turning them into beautiful '2+0.3'.
  } else if (input == '.') {
    if (_isLastNumberInt(calcOut)) {
      if (!_isLastCharNumeric(calcOut)) {
        calcOut += '0';
      }
      calcOut += input;
      return calcOut;
    }

  /// The '=' operator has two requirements that need to be met before calculating the result.
  /// Firstly the last character of the output needs to be numeric.
  /// If it's not then the input is not a valid mathematical expression and the function returns the output as is.
  /// Secondly, the result of the calculation needs to be finite.
  /// In other words, it checks for division by zero.
  /// The _evaluate() function returns 'Infinity' in such cases.
  /// So the isInfinite variable returns true if the result is infinite.
  ///
  /// If both requirements are met then there are three more steps.
  /// 1. Using the calcEval variable, the result of the calculation is evaluated.
  ///    1.1 Before calling the _evaluate() function, the output is formatted to replace '×' with '*' and '÷' with '/'.
  ///        This is done because the parser doesn't understand '×' and '÷'.
  ///    1.2 The _evaluate() function does the heavy lifting of evaluating the mathematical expression and is explained in detail below.
  ///    1.3 The result is then converted to an integer (if possible) using the _intify() function.
  ///        This is done because the parser returns a double even if the result is an integer,
  ///        So we remove trailing '.0' from the result for aesthetic reasons.
  /// 2. Then is checks if the existing output is different from the result of the calculation,
  ///    Meaning it checks if the user has entered a new calculation or if they are just spamming the '=' button.
  ///    If the output is different, the lastCalcOut (small numbers above the output) variable is updated with the mathematical expression.
  ///    Also the convOut1 (the input of the conversion page) variable is updated with the result of the calculation.
  ///    And the convOut2 (the output of the conversion page) variable is cleared.
  /// 3. Finally the output is updated with the result of the calculation.
  } else if (input == '=') {
    if (_isLastCharNumeric(calcOut)) {
      bool isInfinite = _evaluate(_formatToMath(calcOut)).contains('Infinity');
      if (!isInfinite) {
        String calcEval = _intify(_evaluate(_formatToMath(calcOut)));
        if (calcOut != calcEval) {
          lastCalcOut = calcOut;
          convOut1 = calcEval;
          convOut2 = '';
        }
        calcOut = calcEval;
        return calcOut;
      }
    }
  }
  return calcOut;
}

/// This function takes a string input and returns a string result.
/// The input is expected to be a number, or a command (IconData(...)).
String handleConvInput(String input) {

  /// If the input is a number, simply add it to the output.
  /// There is never a case when a number input is not added to the output.
  if (_isNumeric(input)) {
    convOut1 += input;
    return convOut1;

  /// The input '.' is handled in the exact same way as in the handleCalcInput() function.
  } else if (input == '.') {
    if (_isLastNumberInt(convOut1)) {
      if (!_isLastCharNumeric(convOut1)) {
        convOut1 += '0';
      }
      convOut1 += input;
      return convOut1;
    }

  /// IconData(U+0EEB5) is the backspace icon.
  /// Handled in the same way as in the handleCalcInput() function.
  } else if (input == 'IconData(U+0EEB5)') {
    convOut1 = _removeLastChar(convOut1);
    return convOut1;

  /// IconData(U+0E627) is the swap icon.
  /// It swaps the dropdown values.
  /// Also if the conversion outputs are not empty,
  /// It swaps the conversion outputs and updates the convOut2 variable with the result of the conversion.
  } else if (input == 'IconData(U+0E627)') {
    String temp = ddValue1;
    ddValue1 = ddValue2;
    ddValue2 = temp;
    if (convOut1 != '' && convOut2 != '') {
      convOut2 = _convert();
    }
    return convOut1;

  /// Clears both outputs
  } else if (input == 'AC') {
    convOut1 = '';
    convOut2 = '';
    return convOut1;
  }
  return convOut1;
}

/// Fires everytime the user inputs something.
/// It checks if the input is 'Convert' and if it is, it calls the _convert() function.
String giveConvOut(String input) {
  if (input == 'Convert') {
    return _convert();
  }
  return convOut2;
}

/// This function checks if a string can be parsed into a number.
bool _isNumeric(String s) {
  try {
    num.parse(s);
    return true;
  } catch (e) {
    return false;
  }
}

/// This function returns the last character of a string.
String _getLastChar(String s) {
  if (s == '') {
    return '';
  }
  return s.substring(s.length - 1);
}

/// This function checks if the last character of a string is numeric.
bool _isLastCharNumeric(String s) {
  return _isNumeric(_getLastChar(s));
}

/// This function removes the last character of a string.
String _removeLastChar(String s) {
  if (s == '') {
    return '';
  }
  return s.substring(0, s.length - 1);
}

/// This function replaces mathematical operators in a string with their equivalent symbols in Dart.
String _formatToMath(String s) {
  String formatted = s.replaceAll('×', '*');
  formatted = formatted.replaceAll('÷', '/');
  formatted = formatted.replaceAll('−', '-');
  return formatted;
}

/// This function replaces the last character of a string with a new character.
String _replaceLastChar(String s, String newChar) {
  return s.substring(0, s.length - 1) + newChar;
}

/// This function checks if the last number in a string is an integer.
bool _isLastNumberInt(String s) {
  int i = s.length - 1;
  while (i >= 0) {
    if (_isNumeric(s[i])) {
      i--;
    } else {
      if (s[i] == '.') {
        return false;
      }
      return true;
    }
  }
  return true;
}

/// This function removes trailing '.0' from a string.
String _intify(String s) {
  if (_getLastChar(s) == '0')  {
    if (_getLastChar(s.substring(0, s.length - 1)) == '.') {
      return s.substring(0, s.length - 2);
    }
  }
  return s;
}

/// The _evaluate function is used to evaluate mathematical expressions entered by the user.
/// Here's a step-by-step explanation of what the function does:
/// 1. It takes a string input as an argument. This string is expected to be a mathematical expression, such as "2+2" or "3*7".
/// 2. It creates an instance of the Parser class from the math_expressions package.
///    The Parser class is used to parse strings into mathematical expressions that can be evaluated.
/// 3. It calls the parse method of the Parser instance, passing the input string as an argument.
///    The parse method converts the string into an Expression object.
/// 4. It creates an instance of the ContextModel class, also from the math_expressions package.
///    The ContextModel class is used to provide a context for evaluating expressions. In this case, no specific context is provided, so the default context is used.
/// 5. It calls the evaluate method of the Expression object, passing EvaluationType.REAL and the ContextModel instance as arguments.
///    The evaluate method calculates the result of the expression. EvaluationType.REAL indicates that the result should be a real number.
/// 6. It converts the result of the evaluation to a string and returns it.
String _evaluate(String input) {
  Parser p = Parser();
  Expression exp = p.parse(input);
  ContextModel cm = ContextModel();
  return exp.evaluate(EvaluationType.REAL, cm).toString();
}


/// The _convert function is used to convert an amount from one currency to another.
/// It uses the global exchange rates stored in the `ratesGlobal` map.
///
/// Here's a step-by-step explanation of what the function does:
///
/// 1. It takes the amount to be converted from `convOut1`.
/// 2. It retrieves the exchange rates from the `ratesGlobal` map.
/// 3. It retrieves the base currency (the currency from which the amount is being converted) from `ddValue1`.
/// 4. It retrieves the final currency (the currency to which the amount is being converted) from `ddValue2`.
/// 5. It calculates the amount in USD by dividing the amount by the exchange rate of the base currency.
/// 6. It calculates the final amount by multiplying the amount in USD by the exchange rate of the final currency.
/// 7. It formats the final amount to 6 decimal places and stores it in `convOut2`.
/// 8. It returns the final amount as a string.
String _convert() {
  String amount = convOut1;
  Map exchangeRates = ratesGlobal;
  String currencyBase = ddValue1;
  String currencyFinal = ddValue2;
  double usdAmount = double.parse(amount) / exchangeRates[currencyBase];
  String output = (usdAmount * exchangeRates[currencyFinal]).toStringAsFixed(6);
  convOut2 = output;
  return output;
}
