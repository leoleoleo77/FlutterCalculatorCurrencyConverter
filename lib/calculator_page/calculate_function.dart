import 'package:bestest_calculator/saved_data.dart';
import 'package:math_expressions/math_expressions.dart';


/// This function takes a string input and returns a string result.
/// The input is expected to be a number, a mathematical expression or a command.
/// The function handles the following commands:
/// 'I' - remove the last character from the output
/// 'C' - clear the output
/// '+', '−', '÷', '×', '.' - add the operator to the output if the last character is numeric
/// '=' - evaluate the mathematical expression in the output
String GetCalcResult(String input) {
  if (isNumeric(input)) {
    calcOut += input;
    return calcOut;
  } else if (input == 'I') {
    calcOut = removeLastChar(calcOut);
    return calcOut;
  } else if (input == 'C') {
    if (calcOut != '') {
      calcOut = '';
    }
    lastCalcOut = '';
    return calcOut;
  } else if (input == '+') {
    if (isLastCharNumeric(calcOut)) {
      calcOut += input;
      return calcOut;
    } else if (_getLastChar(calcOut) == '−') {
      calcOut = _replaceLastChar(calcOut, input);
      return calcOut;
    }
  } else if (input == '−') {
    if (isLastCharNumeric(calcOut) || _getLastChar(calcOut) == '×' || _getLastChar(calcOut) == '÷' || _getLastChar(calcOut) == '') {
      calcOut += input;
      return calcOut;
    } else if (_getLastChar(calcOut) == '+') {
      calcOut = _replaceLastChar(calcOut, input);
      return calcOut;
    }
  } else if (input == '÷') {
    if (isLastCharNumeric(calcOut)) {
      calcOut += input;
      return calcOut;
    }
  } else if (input == '×') {
    if (isLastCharNumeric(calcOut)) {
      calcOut += input;
      return calcOut;
    }
  } else if (input == '.') {
    if (isLastNumberInt(calcOut)) {
      if (!isLastCharNumeric(calcOut)) {
        calcOut += '0';
      }
      calcOut += input;
      return calcOut;
    }
  } else if (input == '=') {
    if (isLastCharNumeric(calcOut)) {
      bool isInfinite = _evaluate(_formatToMath(calcOut)).contains('Infinity');
      if (!isInfinite) {
        String calcEval = _intify(_evaluate(_formatToMath(calcOut)));
        if (calcOut != calcEval) {
          lastCalcOut = calcOut;
          convOut1 = calcEval;
          convOut2 = '';
        }
        calcOut = calcEval.replaceAll('-', '−');
        return calcOut;
      }
    }
  }
  return calcOut;
}

/// This function checks if a string can be parsed into a number.
bool isNumeric(String s) {
  try {
    var value = num.parse(s);
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
bool isLastCharNumeric(String s) {
  return isNumeric(_getLastChar(s));
}

/// This function removes the last character of a string.
String removeLastChar(String s) {
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
bool isLastNumberInt(String s) {
  int i = s.length - 1;
  while (i >= 0) {
    if (isNumeric(s[i])) {
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